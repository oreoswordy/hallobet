import 'package:csv/csv.dart';
import 'package:flutter/services.dart';
import 'package:ml_algo/ml_algo.dart';
import 'package:ml_dataframe/ml_dataframe.dart';

class ObesityRepository {
  KnnClassifier? _classifier;

  Future<void> muatModel() async {
    final rawCsvContent =
        await rootBundle.loadString('assets/obesity_dataset.csv');
    final rawData = const CsvToListConverter().convert(rawCsvContent);
    final samples = DataFrame(rawData, headerExists: true);
    final targetName = 'nObeyesdad';

    _classifier = KnnClassifier(
      samples,
      targetName,
      3,
      distance: Distance.euclidean,
    );
  }

  String prediksiObesitas({
    required String jenisKelamin,
    required double usia,
    required double tinggi,
    required double berat,
    required String riwayatKeluargaObesitas,
    required String favc,
    required int frekuensiSayur,
    required double jumlahMakan,
    required String caec,
    required String merokok,
    required double konsumsiAir,
    required String pemantauanKalori,
    required double aktivitasFisik,
    required double waktuTeknologi,
    required String konsumsiAlkohol,
    required String transportasi,
  }) {
    final fitur = DataFrame([
      [
        jenisKelamin,
        usia,
        tinggi,
        berat,
        riwayatKeluargaObesitas,
        favc,
        frekuensiSayur,
        jumlahMakan,
        caec,
        merokok,
        konsumsiAir,
        pemantauanKalori,
        aktivitasFisik,
        waktuTeknologi,
        konsumsiAlkohol,
        transportasi,
      ]
    ], headerExists: false);

    final labelPrediksi = _classifier?.predict(fitur);
    return labelPrediksi?.rows.first.first.toString() ?? 'Tidak Diketahui';
  }
}
