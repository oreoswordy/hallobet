import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hallobet/model/information.dart';
import 'package:hallobet/model/obesity.dart';
import 'package:csv/csv.dart';

class InformationViewModel extends ChangeNotifier {
  List<Information> _items = [];

  List<Information> get items => _items;

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/dummy.json');
    final data = json.decode(response);
    _items = List<Information>.from(
        data["items"].map((item) => Information.fromMap(item)));
    notifyListeners();
  }

  void initialize() {
    if (_items.isEmpty) {
      readJson();
    }
  }
}

class CsvViewModel extends ChangeNotifier {
  List<Obesity> _data = [];

  List<Obesity> get data => _data;

  Future<void> loadCSV() async {
    final _rawData = await rootBundle.loadString("assets/obesity_dataset.csv");
    List<List<dynamic>> _listData =
        const CsvToListConverter().convert(_rawData);

    // Skip header row and convert each data row to an Obesity instance
    _data = _listData.skip(1).map((row) => Obesity.fromList(row)).toList();

    notifyListeners();
  }

  void initialize() {
    if (_data.isEmpty) {
      loadCSV();
    }
  }
}
