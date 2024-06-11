import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hallobet/model/obesity.dart';
import 'package:csv/csv.dart';
import 'package:ml_algo/ml_algo.dart';
import 'package:ml_dataframe/ml_dataframe.dart';

class CsvViewModel extends ChangeNotifier {
  List<Obesity> _data = [];

  List<Obesity> get data => _data;

  KnnClassifier? _classifier;

  List<String> catCols = [];
  List<String> numCols = [];

  Future<void> loadCSV() async {
    final _rawData = await rootBundle.loadString("assets/obesity_dataset.csv");
    List<List<dynamic>> _listData =
        const CsvToListConverter().convert(_rawData);

    final samples = DataFrame.fromRawCsv(_rawData, headerExists: true);
    final targetName = 'NObeyesdad';

    for (var series in samples.series) {
      if (series.data.first.runtimeType == String &&
          series.name != targetName) {
        catCols.add(series.name);
      } else if (series.name != targetName) {
        numCols.add(series.name);
      }
    }

    print(catCols);
    print(numCols);

    List<List<dynamic>> transformedData = preprocessData(_listData);
    log(transformedData.toString());

    final samplesTransformed = DataFrame(transformedData, headerExists: true);

    _classifier = KnnClassifier(
      samplesTransformed,
      targetName,
      3,
      distance: Distance.euclidean,
    );

    // Skip header row and convert each data row to an Obesity instance
    _data = _listData.skip(1).map((row) => Obesity.fromList(row)).toList();

    notifyListeners();
  }

  

  List<List<dynamic>> preprocessData(List<List<dynamic>> data) {
    List<dynamic> header = data.first;
    List<List<dynamic>> rows = data.skip(1).toList();

    List<dynamic> newHeader = [];
    List<List<dynamic>> newRows = [];

    for (String col in numCols) {
      newHeader.add(col);
    }

    // One-hot encoding
    for (String col in catCols) {
      Set<dynamic> uniqueValues =
          rows.map((row) => row[header.indexOf(col)]).toSet();
      for (var value in uniqueValues) {
        newHeader.add('$col\_$value');
      }
    }

    newHeader.add('NObeyesdad');

    for (List<dynamic> row in rows) {
      List<dynamic> newRow = [];
      for (String col in numCols) {
        newRow.add(row[header.indexOf(col)]);
      }

      for (String col in catCols) {
        Set<dynamic> uniqueValues =
            rows.map((r) => r[header.indexOf(col)]).toSet();
        for (var value in uniqueValues) {
          newRow.add(row[header.indexOf(col)] == value ? 1 : 0);
        }
      }

      newRow.add(row[header.indexOf('NObeyesdad')]);
      newRows.add(newRow);
    }

    return [newHeader, ...newRows];
  }

  void initialize() {
    if (_data.isEmpty) {
      loadCSV();
    }
  }
}
