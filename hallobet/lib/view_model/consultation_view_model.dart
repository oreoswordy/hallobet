import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hallobet/model/obesity.dart';
import 'package:hallobet/view_model/csv_view_model.dart';
import 'package:ml_algo/ml_algo.dart';
import 'package:ml_dataframe/ml_dataframe.dart';
import 'package:csv/csv.dart';

import '../model/consultation.dart';

class ConsultationViewModel extends ChangeNotifier {
  TextEditingController jenisKelaminController = TextEditingController();
  TextEditingController usiaController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController frequnceVegetable = TextEditingController();
  TextEditingController frequnceEat = TextEditingController();
  TextEditingController frequnceDrink = TextEditingController();
  TextEditingController frequnceActivity = TextEditingController();
  TextEditingController frequnceUseTech = TextEditingController();
  TextEditingController pickOptionController = TextEditingController();
  TextEditingController snackController = TextEditingController();
  TextEditingController obesityController = TextEditingController();
  TextEditingController caloriesController = TextEditingController();
  TextEditingController cigaretteController = TextEditingController();
  TextEditingController countingCaloriesController = TextEditingController();
  TextEditingController transportationController = TextEditingController();
  TextEditingController alcoholController = TextEditingController();

  // GenderCategory? selectedGender;
  // OptionCategory? selectedObecity;
  // OptionCategory? selectedCalories;
  // OptionCategory? selectedCigarette;
  // OptionCategory? selectedCountingCalories;
  // TKSS? selectedVegetable;
  // TKSS? selectedEat;
  // TKSS? selectedSnack;
  // TKSS? selectedActivity;
  // KSS? selectedDrink;
  // TKS? selectedUseTech;
  // TKS? selectedAlcohol;

  // TransportationCategory? selectedTransportation;

  PickOption? selectedPickOption;
  PickOption? selectedVegetable;
  PickOption? selectedEat;
  PickOption? selectedSnack;
  PickOption? selectedDrink;
  PickOption? selectedActivity;
  PickOption? selectedUseTech;
  PickOption? selectedAlcohol;

  PickOptionYesNo? selectedObecity;
  PickOptionYesNo? selectedCalories;
  PickOptionYesNo? selectedCigarette;
  PickOptionYesNo? selectedCountingCalories;

  PickOptionTransportation? selectedTransportation;

  PickOptionGender? selectedGender;

  NumberFrequence? selectedNumberFrequenceEat;
  NumberFrequence? selectedNumberFrequenceDrink;
  NumberFrequence? selectedNumberFrequenceActivity;
  NumberFrequence? selectedNumberFrequenceUseTech;

  String _predictionResult = 'Tidak Diketahui';
  String get predictionResult => _predictionResult;

  List<Obesity> dataset = [];
  KnnClassifier? _classifier;

  int k = 5; // Nilai k untuk KNN
  // Method to convert categorical values to numeric
  double convertCategoricalValue(String category, Map<String, double> map) {
    return map[category] ?? 0.0;
  }

  // Map categorical values to numbers
  final Map<String, double> genderMap = {'Male': 1.0, 'Female': 0.0};
  final Map<String, double> yesNoMap = {'Yes': 1.0, 'No': 0.0};
  final Map<String, double> frequencyMap = {
    'Never': 0.0,
    'Sometimes': 1.0,
    'Frequently': 2.0,
    'Always': 3.0
  };
  final Map<String, double> transportationMap = {
    'Walking': 0.0,
    'Automobile': 1.0,
    'Motorbike': 2.0,
    'Public_Transportation': 3.0,
    'Bike': 4.0
  };

  List<DropdownMenuItem<OptionCategory>> get optionItems {
    return OptionCategory.values.map((choice) {
      return DropdownMenuItem<OptionCategory>(
        value: choice,
        child: Text(choice.label),
      );
    }).toList();
  }

  List<DropdownMenuItem<TKSS>> get tkssItems {
    return TKSS.values.map((choice) {
      return DropdownMenuItem<TKSS>(
        value: choice,
        child: Text(choice.label),
      );
    }).toList();
  }

  List<DropdownMenuItem<KSS>> get kssItems {
    return KSS.values.map((choice) {
      return DropdownMenuItem<KSS>(
        value: choice,
        child: Text(choice.label),
      );
    }).toList();
  }

  List<DropdownMenuItem<TKS>> get tksItems {
    return TKS.values.map((choice) {
      return DropdownMenuItem<TKS>(
        value: choice,
        child: Text(choice.label),
      );
    }).toList();
  }

  void setFrequenceVegetable(PickOption? value) {
    selectedVegetable = value;
    frequnceVegetable.text = value?.label ?? "";
    notifyListeners();
  }

  List<DropdownMenuItem<NumberFrequence>> get numberFrequenceVegetableItems {
    return NumberFrequence.values.map((choice) {
      return DropdownMenuItem<NumberFrequence>(
        value: choice,
        child: Text(choice.label),
      );
    }).toList();
  }

  void setFrequnceEat(NumberFrequence? value) {
    selectedNumberFrequenceEat = value;
    frequnceEat.text = value?.label ?? "";
    notifyListeners();
  }

  List<DropdownMenuItem<NumberFrequence>> get numberFrequenceEatItems {
    return NumberFrequence.values.map((choice) {
      return DropdownMenuItem<NumberFrequence>(
        value: choice,
        child: Text(choice.label),
      );
    }).toList();
  }

  void setFrequnceDrink(NumberFrequence? value) {
    selectedNumberFrequenceDrink = value;
    frequnceDrink.text = value?.label ?? "";
    notifyListeners();
  }

  List<DropdownMenuItem<NumberFrequence>> get numberFrequenceDrinkItems {
    return NumberFrequence.values.map((choice) {
      return DropdownMenuItem<NumberFrequence>(
        value: choice,
        child: Text(choice.label),
      );
    }).toList();
  }

  void setFrequnceActivity(NumberFrequence? value) {
    selectedNumberFrequenceActivity = value;
    frequnceActivity.text = value?.label ?? "";
    notifyListeners();
  }

  List<DropdownMenuItem<NumberFrequence>> get numberFrequenceActivityItems {
    return NumberFrequence.values.map((choice) {
      return DropdownMenuItem<NumberFrequence>(
        value: choice,
        child: Text(choice.label),
      );
    }).toList();
  }

  void setFrequnceUseTech(NumberFrequence? value) {
    selectedNumberFrequenceUseTech = value;
    frequnceUseTech.text = value?.label ?? "";
    notifyListeners();
  }

  List<DropdownMenuItem<NumberFrequence>> get numberFrequenceUseTechItems {
    return NumberFrequence.values.map((choice) {
      return DropdownMenuItem<NumberFrequence>(
        value: choice,
        child: Text(choice.label),
      );
    }).toList();
  }

  List<DropdownMenuItem<PickOption>> get numberPickOptionItems {
    return PickOption.values.map((choice) {
      return DropdownMenuItem<PickOption>(
        value: choice,
        child: Text(choice.label),
      );
    }).toList();
  }

  List<DropdownMenuItem<PickOptionNol>> get numberPickOptionItemsNol {
    return PickOptionNol.values.map((choice) {
      return DropdownMenuItem<PickOptionNol>(
        value: choice,
        child: Text(choice.label),
      );
    }).toList();
  }

  void setPickOption(PickOption? value) {
    selectedPickOption = value;
    pickOptionController.text = value?.label ?? "";
    notifyListeners();
  }

  void setVegetable(PickOption? value) {
    selectedVegetable = value;
    frequnceVegetable.text = value?.label ?? "";
    notifyListeners();
  }

  void setEat(PickOption? value) {
    selectedEat = value;
    notifyListeners();
  }

  void setSnack(PickOption? value) {
    selectedSnack = value;
    snackController.text = value?.label ?? "";
    notifyListeners();
  }

  void setDrink(PickOption? value) {
    selectedDrink = value;
    frequnceDrink.text = value?.label ?? "";
    notifyListeners();
  }

  void setActivity(PickOption? value) {
    selectedActivity = value;
    frequnceActivity.text = value?.label ?? "";
    notifyListeners();
  }

  void setUseTech(PickOption? value) {
    selectedUseTech = value;
    frequnceUseTech.text = value?.label ?? "";
    notifyListeners();
  }

  void setAlcohol(PickOption? value) {
    selectedAlcohol = value;
    alcoholController.text = value?.label ?? "";
    notifyListeners();
  }

  List<DropdownMenuItem<PickOptionYesNo>> get yesnoItems {
    return PickOptionYesNo.values.map((choice) {
      return DropdownMenuItem<PickOptionYesNo>(
        value: choice,
        child: Text(choice.label),
      );
    }).toList();
  }

  void setObecity(PickOptionYesNo? value) {
    selectedObecity = value;
    obesityController.text = value?.label ?? "";
    print(selectedObecity?.value);
    notifyListeners();
  }

  void setCalories(PickOptionYesNo? value) {
    selectedCalories = value;
    caloriesController.text = value?.label ?? "";
    print(selectedCalories?.value);
    notifyListeners();
  }

  void setCigarette(PickOptionYesNo? value) {
    selectedCigarette = value;
    cigaretteController.text = value?.label ?? "";
    print(selectedCalories?.value);
    notifyListeners();
  }

  void setCountingCalories(PickOptionYesNo? value) {
    selectedCountingCalories = value;
    countingCaloriesController.text = value?.label ?? "";
    notifyListeners();
  }

  List<DropdownMenuItem<PickOptionTransportation>> get transportationItems {
    return PickOptionTransportation.values.map((choice) {
      return DropdownMenuItem<PickOptionTransportation>(
        value: choice,
        child: Text(choice.label),
      );
    }).toList();
  }

  void setTransportation(PickOptionTransportation? value) {
    selectedTransportation = value;
    transportationController.text = value?.label ?? "";
    print(selectedTransportation?.value);
    notifyListeners();
  }

  List<DropdownMenuItem<PickOptionGender>> get genderItems {
    return PickOptionGender.values.map((choice) {
      return DropdownMenuItem<PickOptionGender>(
        value: choice,
        child: Text(choice.label),
      );
    }).toList();
  }

  void setGender(PickOptionGender? value) {
    selectedGender = value;
    jenisKelaminController.text = value?.label ?? "";
    print(selectedGender?.value);
    notifyListeners();
  }

  void reset() {
    selectedGender = null;
    selectedObecity = null;
    selectedCalories = null;
    selectedCigarette = null;
    selectedCountingCalories = null;
    selectedVegetable = null;
    selectedEat = null;
    selectedSnack = null;
    selectedActivity = null;
    selectedDrink = null;
    selectedUseTech = null;
    selectedAlcohol = null;
    selectedTransportation = null;
    notifyListeners();
  }

  void submit() async {
    final _rawData = await rootBundle.loadString("assets/obesity_dataset.csv");
    List<List<dynamic>> _listData =
        const CsvToListConverter().convert(_rawData);

    final samples = DataFrame.fromRawCsv(_rawData, headerExists: true);
    final targetName = 'NObeyesdad';

    // _classifier = KnnClassifier(
    //     samples, targetName, k, // The number of nearest neighbours
    //     distance: Distance.euclidean);
    // for (int i = 0; i < 1; i++) {
    //   final dataRow = samples.rows.elementAt(i).toList();
    //   final csvGenderValue = dataRow[0] as num;
    //   final csvUsiaValue = dataRow[1] as num;
    //   final csvTinggiValue = dataRow[2] as num;
    //   final csvBeratValue = dataRow[3] as num;
    //   final csvObesitasValue = dataRow[4] as num;
    //   final csvKaloriValue = dataRow[5] as num;
    //   final csvSayurValue = dataRow[6] as num;
    //   final csvMakanValue = dataRow[7] as num;
    //   final csvSnackValue = dataRow[8] as num;
    //   final csvRokokValue = dataRow[9] as num;
    //   final csvMinumValue = dataRow[10] as num;
    //   final csvMenghitungKaloriValue = dataRow[11] as num;
    //   final csvAktivitasValue = dataRow[12] as num;
    //   final csvTeknologiValue = dataRow[13] as num;
    //   final csvAlkoholValue = dataRow[14] as num;
    //   final csvTransportasiValue = dataRow[15] as num;

    //   print('Nilai Index 0 baris 0 : ${csvGenderValue}');
    // }

    // print(samples);
    // print(samples.rows.length);

    print('Jenis Kelamin: ${selectedGender?.value ?? "belum diisi"}');
    print('Usia: ${usiaController.text}');
    print('Tinggi: ${heightController.text}');
    print('Berat: ${weightController.text}');
    print('Obesitas: ${selectedObecity?.value ?? "belum dipilih"}');
    print('Kalori: ${selectedCalories?.value ?? "belum dipilih"}');
    print('Sayur: ${selectedVegetable?.value ?? "belum dipilih"}');
    print('Makan: ${selectedEat?.value ?? "belum dipilih"}');
    print('Snack: ${selectedSnack?.value ?? "belum dipilih"}');
    print('Rokok: ${selectedCigarette?.value ?? "belum dipilih"}');
    print('Minum: ${selectedDrink?.value ?? "belum dipilih"}');
    print(
        'Menghitung Kalori: ${selectedCountingCalories?.value ?? "belum dipilih"}');
    print('Aktivitas: ${selectedActivity?.value ?? "belum dipilih"}');
    print(
        'Menggunakan Teknologi: ${selectedUseTech?.value ?? "belum dipilih"}');
    print('Alkohol: ${selectedAlcohol?.value ?? "belum dipilih"}');
    print('Transportasi: ${selectedTransportation?.value ?? "belum dipilih"}');

    final features = DataFrame.fromSeries([
      //     Series('gender', [convertCategoricalValue(selectedGender!.label, genderMap)]),
      //     Series('age', [usiaController]),
      //     Series('height', [heightController]),
      //     Series('weight', [weightController]),
      //     Series('familyHistoryWithOverweight', [convertCategoricalValue(selectedObecity!.label, yesNoMap)]),
      //     Series('favc', [convertCategoricalValue(selectedCalories!.label, yesNoMap)]),
      //     Series('fcvc', [convertCategoricalValue(selectedVegetable!.label, frequencyMap)]),
      //     Series('ncp', [convertCategoricalValue(selectedEat!.label, frequencyMap)]),
      //     Series('caec', [convertCategoricalValue(selectedSnack!.label, frequencyMap)]),
      //     Series('smoke', [convertCategoricalValue(selectedCigarette!.label, yesNoMap)]),
      //     Series('ch2o', [convertCategoricalValue(selectedDrink!.label, frequencyMap)]),
      //     Series('scc', [convertCategoricalValue(selectedCountingCalories!.label, yesNoMap)]),
      //     Series('faf', [convertCategoricalValue(selectedActivity!.label, frequencyMap)]),
      //     Series('tue', [convertCategoricalValue(selectedUseTech!.label, frequencyMap)]),
      //     Series('calc', [convertCategoricalValue(selectedAlcohol!.label, frequencyMap)]),
      //     Series('mtrans', [convertCategoricalValue(selectedTransportation!.label, transportationMap)]),

      Series('genders', [selectedGender?.value]),
      Series('age', [usiaController.text]),
      Series('height', [heightController.text]),
      Series('weight', [weightController.text]),
      Series('familyHistoryWithOverweight', [selectedObecity?.value]),
      Series('favc', [selectedCalories?.value]),
      Series('fcvc', [selectedVegetable?.value]),
      Series('ncp', [selectedEat?.value]),
      Series('caec', [selectedSnack?.value]),
      Series('smoke', [selectedCigarette?.value]),
      Series('ch2o', [selectedDrink?.value]),
      Series('scc', [selectedCountingCalories?.value]),
      Series('faf', [selectedActivity?.value]),
      Series('tue', [selectedUseTech?.value]),
      Series('calc', [selectedAlcohol?.value]),
      Series('mtrans', [selectedTransportation?.value]),
      // Add other fields as needed
    ]);

    // Perform prediction
    final prediction = _classifier?.predict(features).toMatrix();
    _predictionResult =
        prediction?[0][0]?.toString() ?? 'Prediksi Hasil Akhir = Unknown';

    notifyListeners();
    print(predictionResult);

    //Perhitungan Euclidean
    print('===================');
    print(' Hitung Euclidean');

    // Mengambil Nilai Inputan User lalu mengubahnya menjadi angka yang bisa dihitung
    final genderValue = selectedGender?.value ?? 0;
    final usia = int.parse(usiaController.text);
    final tinggiValue = int.parse(heightController.text);
    final tinggi = tinggiValue/100;
    final berat = int.parse(weightController.text);

    final obesitasValue = selectedObecity?.value ?? 0;
    final kaloriValue = selectedCalories?.value ?? 0;
    final sayurValue = selectedVegetable?.value ?? 0;
    final makanValue = selectedEat?.value ?? 0;
    final snackValue = selectedSnack?.value ?? 0;
    final rokokValue = selectedCigarette?.value ?? 0;
    final minumValue = selectedDrink?.value ?? 0;
    final menghitungKaloriValue = selectedCountingCalories?.value ?? 0;
    final aktivitasValue = selectedActivity?.value ?? 0;
    final teknologiValue = selectedUseTech?.value ?? 0;
    final alkoholValue = selectedAlcohol?.value ?? 0;
    final transportasiValue = selectedTransportation?.value ?? 0;

    // Ini hanya pengecekan apakah nilai inputan user bisa digunakan untuk perhitungan
    // int hitung = genderValue +
    //     usia +
    //     tinggi +
    //     berat +
    //     obesitasValue +
    //     kaloriValue +
    //     sayurValue +
    //     makanValue +
    //     snackValue +
    //     rokokValue +
    //     minumValue +
    //     menghitungKaloriValue +
    //     aktivitasValue +
    //     teknologiValue +
    //     alkoholValue +
    //     transportasiValue;

    // Ada hal aneh, Di dataset hanya ada 4 kategori tapi di inputan ada 5 kategori
    // print('Nilai Gender Input User = $snackValue');
    // print('Nilai Sayur Input User = $sayurValue');
    // print('Nilai Makan Input User = $makanValue');
    // print('Nilai Minum Input User = $minumValue');
    // print('Nilai Tinggi Setelah Dibagi 100 = $tinggi');

    List<double> euclidean = [];

    List<Map<String, dynamic>> HasilAkhir = [];

    print('=================================');
    print(' Penyesuaian nilai Dataset');
    print('=================================');

    // // Fungsi Konversi Dataset
    // num convertStringToNum(String value, int row) {
    //   switch (row) {
    //     case 4:
    //     case 5:
    //     case 9:
    //     case 11:
    //       return (value == 'yes') ? 1 : 0;
    //     case 8:
    //     case 14:
    //       if (value == 'Sometimes') return 1;
    //       if (value == 'Frequently') return 2;
    //       if (value == 'Always') return 3;
    //       return 0; // 'no'
    //     case 15:
    //       if (value == 'Public_Transportation') return 1;
    //       if (value == 'Bike') return 2;
    //       if (value == 'Motorbike') return 3;
    //       if (value == 'Automobile') return 4;
    //       return 0; // 'Walking'
    //     default:
    //       return 0;
    //   }
    // }

    for (int i = 0; i < 2110; i++) {
      final dataRow = samples.rows.elementAt(i).toList();
      final csvGenderValue = dataRow[0] as num;
      final csvUsiaValue = dataRow[1] as num;
      final csvTinggiValue = dataRow[2] as num;
      final csvBeratValue = dataRow[3] as num;
      final csvObesitasValue = dataRow[4] as num;
      final csvKaloriValue = dataRow[5] as num;
      final csvSayurValue = dataRow[6] as num;
      final csvMakanValue = dataRow[7] as num;
      final csvSnackValue = dataRow[8] as num;
      final csvRokokValue = dataRow[9] as num;
      final csvMinumValue = dataRow[10] as num;
      final csvMenghitungKaloriValue = dataRow[11] as num;
      final csvAktivitasValue = dataRow[12] as num;
      final csvTeknologiValue = dataRow[13] as num;
      final csvAlkoholValue = dataRow[14] as num;
      final csvTransportasiValue = dataRow[15] as num;
      final csvDiagnosis = dataRow[16] as String;

      // Digunakan untuk pengecekan dataset apakah data yang diambil sdh sesuai
      // print('Nilai Index 0 baris ${i + 1} : ${csvGenderValue}');
      // print('Nilai Index 1 baris ${i + 1} : ${csvUsiaValue}');
      // print('Nilai Index 2 baris ${i + 1} : ${csvTinggiValue}');
      // print('Nilai Index 3 baris ${i + 1} : ${csvBeratValue}');
      // print('Nilai Index 4 baris ${i + 1} : ${csvObesitasValue}');
      // print('Nilai Index 5 baris ${i + 1} : ${csvKaloriValue}');
      // print('Nilai Index 6 baris ${i + 1} : ${csvSayurValue}');
      // print('Nilai Index 7 baris ${i + 1} : ${csvMakanValue}');
      // print('Nilai Index 8 baris ${i + 1} : ${csvSnackValue}');
      // print('Nilai Index 9 baris ${i + 1} : ${csvRokokValue}');
      // print('Nilai Index 10 baris ${i + 1} : ${csvMinumValue}');
      // print('Nilai Index 11 baris ${i + 1} : ${csvMenghitungKaloriValue}');
      // print('Nilai Index 12 baris ${i + 1} : ${csvAktivitasValue}');
      // print('Nilai Index 13 baris ${i + 1} : ${csvTeknologiValue}');
      // print('Nilai Index 14 baris ${i + 1} : ${csvAlkoholValue}');
      // print('Nilai Index 15 baris ${i + 1} : ${csvTransportasiValue}');
      // print('Nilai Index 16 baris ${i + 1} : ${csvDiagnosis}');

      // Ini hanya pengecekan apakah nilai yang diambil dari dataset bisa digunakan untuk perhitungan
      // final teshitung = csvGenderValue +
      //     csvUsiaValue +
      //     csvTinggiValue +
      //     csvBeratValue +
      //     csvSayurValue +
      //     csvMakanValue +
      //     csvMinumValue +
      //     csvAktivitasValue +
      //     csvTeknologiValue;
      // print('Nilai Akhir dataset baris ${i + 1} : ${teshitung}');

      // Perhitungan Euclidean
      final hitung = pow(genderValue - csvGenderValue, 2) +
          pow(usia - csvUsiaValue, 2) +
          pow(tinggi - csvTinggiValue, 2) +
          pow(berat - csvBeratValue, 2) +
          pow(obesitasValue - csvObesitasValue, 2) +
          pow(kaloriValue - csvKaloriValue, 2) +
          pow(sayurValue - csvSayurValue, 2) +
          pow(makanValue - csvMakanValue, 2) +
          pow(snackValue - csvSnackValue, 2) +
          pow(rokokValue - csvRokokValue, 2) +
          pow(minumValue - csvMinumValue, 2) +
          pow(menghitungKaloriValue - csvMenghitungKaloriValue, 2) +
          pow(aktivitasValue - csvAktivitasValue, 2) +
          pow(teknologiValue - csvTeknologiValue, 2) +
          pow(alkoholValue - csvAlkoholValue, 2) +
          pow(transportasiValue - csvTransportasiValue, 2);
      final pangkat = sqrt(hitung);

      // Fungsi untuk menambahkan data ke dalam List
      // euclidean.add(pangkat);

      HasilAkhir.add({
        'result': pangkat,
        'diagnosis': csvDiagnosis,
      });

      // print('Nilai  baris ke - ${i + 1} : ${hitung}');
      // print('=================================');
    }

    print('=================================');
    print(' Hasil Hitung Euclidean Distance ');
    print('=================================');

    // Pemanggilan Nilai List Euclidean Harus dipanggil diluar Iterasi
    // print('Nilai  euclidean baris ke 2 : ${euclidean[1]}');

    // Hasil Nilai Hitung Euclidean
    // for (int i = 0; i < euclidean.length; i++) {
    //   print('Nilai euclidean baris ke - [${i + 1}] = ${euclidean[i]}');
    // }

    // for (int i = 0; i < HasilAkhir.length; i++) {
    //   print('Nilai Hasil Akhir Baris ke - [${i + 1}] : ${HasilAkhir[i]}');
    // }

    // Sort Hasil Euclidean
    HasilAkhir.sort((a, b) => a['result'].compareTo(b['result']));

    // euclidean.sort();
    // print('=================================');
    // for (int i = 0; i < HasilAkhir.length; i++) {
    //   print(
    //       'Hasil Euclidean setelah Sort, Baris ke - [${i + 1}] : ${HasilAkhir[i]}');
    // }
    // print('=================================');

    // Mengambil nilai K terdekat dari List
    // List<double> terdekat = euclidean.sublist(0, 3);
    // print('Inilah 3 Nilai Terdekat : ${terdekat}');

    // Mengambil 3 nilai terdekat dari Map
    List<Map<String, dynamic>> terdekat = HasilAkhir.sublist(0, 8);
    for (int i = 0; i < terdekat.length; i++) {
      print('Tujuh Nilai Terdekat, Baris ke - [${i + 1}] : ${terdekat[i]}');
    }
    print('=================================');

    // Fungsi untuk mencari Diagnosis apa yang paling sering keluar diantara tetanggga terdekat
    Map<String, int> diagnosisCount = {};
    for (var entry in terdekat) {
      String diagnosis = entry['diagnosis'];
      if (diagnosisCount.containsKey(diagnosis)) {
        diagnosisCount[diagnosis] = diagnosisCount[diagnosis]! + 1;
      } else {
        diagnosisCount[diagnosis] = 1;
      }
    }

    String mostFrequentDiagnosis = diagnosisCount.keys.first;
    int maxCount = diagnosisCount[mostFrequentDiagnosis]!;
    diagnosisCount.forEach((diagnosis, count) {
      if (count > maxCount) {
        mostFrequentDiagnosis = diagnosis;
        maxCount = count;
      }
    });

    print('Diagnosis Terbanyak: $mostFrequentDiagnosis');

    // print('tes = ${features.series}');

    //   KnnClassifier? _classifier;
    //Sumber Error

    // _classifier = KnnClassifier(
    //   samples,
    //   targetName,
    //   3, // The number of nearest neighbours
    //   distance: Distance.euclidean,
    // );

    // final predict = _classifier?.predict(samples).toMatrix();

    // predict?[0][0].toString();
  }

  Future<void> loadCSVData() async {
    final rawData = await rootBundle.loadString("assets/obesity_dataset.csv");
    List<List<dynamic>> data = CsvToListConverter().convert(rawData);

    // final header = data.first;
    final rows = data.sublist(1);
    final samples = DataFrame(rows);
    final targetName = 'NObeyesdad';

    print(samples);
    print(samples.rows.length);

    // _classifier = KnnClassifier(
    //   samples,
    //   targetName,
    //   3, // The number of nearest neighbours
    //   distance: Distance.euclidean,
    // );

    final predict = _classifier!.predict(samples).toMatrix();

    predict[0][0].toString();
  }

  String predictObesity({
    required String gender,
    required double age,
    required double height,
    required double weight,
    required String familyHistoryWithOverweight,
    required String favc,
    required int fcvc,
    required double ncp,
    required String caec,
    required String smoke,
    required double ch2o,
    required String scc,
    required double faf,
    required double tue,
    required String calc,
    required String mtrans,
  }) {
    if (_classifier == null) {
      return 'Unknown';
    }

    final features = DataFrame([
      [
        gender,
        age,
        height,
        weight,
        familyHistoryWithOverweight,
        favc,
        fcvc,
        ncp,
        caec,
        smoke,
        ch2o,
        scc,
        faf,
        tue,
        calc,
        mtrans,
      ]
    ], headerExists: false);

    final predictedLabels = _classifier!.predict(features);

    return predictedLabels.rows.first.first.toString();
  }

  Future<void> predictObesityResult() async {
    if (_classifier == null) {
      await loadCSVData();
    }

    _predictionResult = predictObesity(
      gender: jenisKelaminController.text,
      age: double.parse(usiaController.text),
      height: double.parse(heightController.text),
      weight: double.parse(weightController.text),
      familyHistoryWithOverweight: selectedObecity?.label ?? '',
      favc: selectedCalories?.label ?? '',
      fcvc: int.parse(selectedVegetable?.label ?? "0"),
      ncp: double.parse(selectedNumberFrequenceEat?.label ?? "0.0"),
      caec: selectedSnack?.label ?? '',
      smoke: selectedCigarette?.label ?? "",
      ch2o: double.parse(selectedNumberFrequenceDrink?.label ?? "0.0"),
      scc: selectedCountingCalories?.label ?? "",
      faf: double.parse(selectedNumberFrequenceActivity?.label ?? "0.0"),
      tue: double.parse(selectedNumberFrequenceUseTech?.label ?? "0.0"),
      calc: selectedAlcohol?.label ?? "",
      mtrans: selectedTransportation?.label ?? "",
    );

    notifyListeners();
  }
}
