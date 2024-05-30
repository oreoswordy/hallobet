// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hallobet/model/obesity.dart';
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

  int k = 5; // Nilai k untuk KNN

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

  void submit() {
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
  }

  KnnClassifier? _classifier;

  List<Obesity> _data = [];

  List<Obesity> get data => _data;

  Future<void> loadModel() async {
    final rawCsvContent =
        await rootBundle.loadString("assets/obesity_dataset.csv");
    List<List<dynamic>> rawData =
        const CsvToListConverter().convert(rawCsvContent);
    // final samples = DataFrame(rawData, headerExists: true);
    final samples = DataFrame.fromRawCsv(rawCsvContent, headerExists: true);
    final targetName = 'NObeyesdad'; // The name of the target column

    _classifier = KnnClassifier(
      samples,
      targetName,
      3, // The number of nearest neighbours
      distance: Distance.euclidean,
    );
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
    // final features = DataFrame([
    //   [
    //     gender,
    //     age,
    //     height,
    //     weight,
    //     familyHistoryWithOverweight,
    //     favc,
    //     fcvc,
    //     ncp,
    //     caec,
    //     smoke,
    //     ch2o,
    //     scc,
    //     faf,
    //     tue,
    //     calc,
    //     mtrans,
    //   ]
    // ], headerExists: false);

    final features = DataFrame.fromSeries([
      Series('gender', [jenisKelaminController]),
      Series('age', [usiaController]),
      Series('height', [heightController]),
      Series('weight', [weightController]),
      Series('familyHistoryWithOverweight', [selectedObecity?.label]),
      Series('favc', [selectedCalories?.label]),
      Series('fcvc', [selectedVegetable?.label]),
      Series('ncp', [selectedNumberFrequenceEat?.label]),
      Series('caec', [selectedSnack?.label]),
      Series('smoke', [selectedCigarette?.label]),
      Series('ch2o', [selectedNumberFrequenceDrink?.label]),
      Series('scc', [selectedCountingCalories?.label]),
      Series('faf', [selectedNumberFrequenceActivity?.label]),
      Series('tue', [selectedNumberFrequenceUseTech?.label]),
      Series('calc', [selectedAlcohol?.label]),
      Series('mtrans', [selectedTransportation?.label]),
    ]);

    final predictedLabels = _classifier?.predict(features);

    print(" hasil ${predictedLabels}");

    return predictedLabels?.rows.first.first.toString() ?? 'Unknown';
  }

  Future<void> predictObesityResult() async {
    if (_classifier == null) {
      await loadModel();
    }

    _predictionResult = predictObesity(
      gender: jenisKelaminController.text,
      age: double.parse(usiaController.text) ?? 0.0,
      height: double.parse(heightController.text) ?? 0.0,
      weight: double.parse(weightController.text) ?? 0.0,
      familyHistoryWithOverweight: selectedObecity?.label ?? '',
      favc: selectedCalories?.label ?? '',
      fcvc: int.parse(selectedVegetable?.label ?? "") ?? 0,
      ncp: double.parse(selectedNumberFrequenceEat?.label ?? "") ?? 0.0,
      caec: selectedSnack?.label ?? '',
      smoke: selectedCigarette?.label ?? "",
      ch2o: double.parse(selectedNumberFrequenceDrink?.label ?? "") ?? 0.0,
      scc: selectedCountingCalories?.label ?? "",
      faf: double.parse(selectedNumberFrequenceActivity?.label ?? "") ?? 0.0,
      tue: double.parse(selectedNumberFrequenceUseTech?.label ?? "") ?? 0.0,
      calc: selectedAlcohol?.label ?? "",
      mtrans: selectedTransportation?.label ?? "",
    );

    notifyListeners();
  }
}
