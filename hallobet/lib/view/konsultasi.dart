import 'package:flutter/material.dart';
import 'package:hallobet/model/consultation.dart';
import 'package:hallobet/view/widget/widget.dart';
import 'package:hallobet/view_model/consultation_view_model.dart';
import 'package:hallobet/view_model/konsultasi_view_model.dart';
import 'package:provider/provider.dart';

class KonsultasiScreen extends StatelessWidget {
  const KonsultasiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget("Tes Konsultasi"),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(12),
          child: Consumer<KonsultasiViewModel>(
            builder: (context, model, child) {
            return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  titleConsultation("Jenis Kelamin"),
                  const SizedBox(height: 12),
                  DropdownButton(
                    hint: const Text("Pilih"),
                    isExpanded: true,
                    value: model.selectedGender,
                    onChanged: model.setGender,
                    items: model.genderItems,
                  ),
                  const SizedBox(height: 24),
                  titleConsultation("Usia"),
                  const SizedBox(height: 12),
                  textFieldConsultation(
                      "Masukkan Usia", model.usiaController),
                  const SizedBox(height: 24),
                  titleConsultation("Tinggi Badan"),
                  const SizedBox(height: 12),
                  textFieldConsultation(
                      "Masukkan Tinggi Badan", model.heightController),
                  const SizedBox(height: 24),
                  titleConsultation("Berat Badan"),
                  const SizedBox(height: 12),
                  textFieldConsultation(
                      "Masukkan Berat Badan", model.weightController),
                  const SizedBox(height: 24),
                  titleConsultation(
                      "Apakah Anda memiliki riwayat keturunan obesitas ?"),
                  const SizedBox(height: 12),
                  DropdownButton(
                    hint: const Text("Pilih"),
                    isExpanded: true,
                    value: model.selectedObecity,
                    onChanged: model.setObecity,
                    items: model.yesnoItems,
                  ),
                  const SizedBox(height: 24),
                  titleConsultation(
                      "Apakah Anda mengonsumsi makanan tinggi kalori ?"),
                  const SizedBox(height: 12),
                  DropdownButton(
                    hint: const Text("Pilih"),
                    isExpanded: true,
                    value: model.selectedCalories,
                    onChanged: model.setCalories,
                    items: model.yesnoItems,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  titleConsultation(
                      "Seberapa sering Anda mengonsumsi Sayuran ?"),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: DropdownButton(
                          hint: const Text('Pilih'),
                          isExpanded: true,
                          value: model.selectedVegetable,
                          onChanged: model.setVegetable,
                          items: model.numberPickOptionItems,
                        ),
                      ),
                      const SizedBox(width: 24),
                      tagText("kali per minggu"),
                    ],
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  titleConsultation(
                      "Seberapa sering anda mengonsumsi makanan dalam sehari ?"),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: DropdownButton(
                          hint: const Text('Pilih'),
                          isExpanded: true,
                          value: model.selectedEat,
                          items: model.numberPickOptionItems,
                          onChanged: model.setEat,
                        ),
                      ),
                      const SizedBox(width: 24),
                      tagText("per hari"),
                    ],
                  ),
                  const SizedBox(height: 24),
                  titleConsultation("Apakah Anda mengonsumsi cemilan ?"),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: DropdownButton(
                          hint: const Text("Pilih"),
                          isExpanded: true,
                          value: model.selectedSnack,
                          items: model.numberPickOptionItems,
                          onChanged: model.setSnack,
                        ),
                      ),
                      const SizedBox(width: 24),
                      tagText("per hari"),
                    ],
                  ),
                  const SizedBox(height: 24),
                  titleConsultation("Apakah Anda merokok ?"),
                  const SizedBox(height: 12),
                  DropdownButton(
                    hint: const Text("Pilih"),
                    isExpanded: true,
                    value: model.selectedCigarette,
                    onChanged: model.setCigarette,
                    items: model.yesnoItems,
                  ),
                  const SizedBox(height: 24),
                  titleConsultation("Seberapa sering Anda minum air putih ?"),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: DropdownButton(
                          hint: const Text("Pilih"),
                          isExpanded: true,
                          value: model.selectedDrink,
                          onChanged: model.setDrink,
                          items: model.numberPickOptionItems,
                        ),
                      ),
                      const SizedBox(width: 24),
                      tagText("liter per hari"),
                    ],
                  ),
                  const SizedBox(height: 24),
                  titleConsultation(
                      "Apakah Anda menghitung kalori yang masuk ke dalam tubuh Anda ?"),
                  const SizedBox(height: 12),
                  DropdownButton(
                    hint: const Text("Pilih"),
                    isExpanded: true,
                    value: model.selectedCountingCalories,
                    onChanged: model.setCountingCalories,
                    items: model.yesnoItems,
                  ),
                  const SizedBox(height: 24),
                  titleConsultation(
                      "Seberapa sering Anda melakukan aktivitas fisik ?"),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: DropdownButton(
                          hint: const Text("Pilih"),
                          isExpanded: true,
                          value: model.selectedActivity,
                          onChanged: model.setActivity,
                          items: model.numberPickOptionItems,
                        ),
                      ),
                      const SizedBox(width: 24),
                      tagText("kali per minggu"),
                    ],
                  ),
                  const SizedBox(height: 24),
                  titleConsultation(
                      "Seberapa sering Anda menggunakan teknologi ?"),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: DropdownButton(
                          hint: const Text("Pilih"),
                          isExpanded: true,
                          value: model.selectedUseTech,
                          onChanged: model.setUseTech,
                          items: model.numberPickOptionItems,
                        ),
                      ),
                      const SizedBox(width: 24),
                      tagText("jam per hari"),
                    ],
                  ),
                  const SizedBox(height: 24),
                  titleConsultation(
                      "Seberapa sering Anda mengonsumsi alkohol ?"),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: DropdownButton(
                          hint: const Text("Pilih"),
                          isExpanded: true,
                          value: model.selectedAlcohol,
                          items: model.numberPickOptionItems,
                          onChanged: model.setAlcohol,
                        ),
                      ),
                      const SizedBox(width: 24),
                      tagText("per minggu"),
                    ],
                  ),
                  const SizedBox(height: 24),
                  titleConsultation(
                      "Transportasi apa yang Anda gunakan sehari - hari ?"),
                  const SizedBox(height: 12),
                  DropdownButton(
                    hint: const Text("Pilih"),
                    isExpanded: true,
                    value: model.selectedTransportation,
                    onChanged: model.setTransportation,
                    items: model.transportationItems,
                  ),
                  const SizedBox(height: 24),
                  Container(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {
                        model.submit();
                        // model.predictObesityResult();
                        // model.predictObesityResult();
                        // model.predictObesityResult();
                        // model.predictObesity(
                        //   gender: model.jenisKelaminController.text,
                        //   age: double.tryParse(model.usiaController.text) ??
                        //       0.0,
                        //   height:
                        //       double.tryParse(model.heightController.text) ??
                        //           0.0,
                        //   weight:
                        //       double.tryParse(model.weightController.text) ??
                        //           0.0,
                        //   familyHistoryWithOverweight:
                        //       model.selectedObecity?.label ?? '',
                        //   favc: model.selectedCalories?.label ?? '',
                        //   fcvc: int.tryParse(
                        //           model.selectedVegetable?.label ?? "") ??
                        //       0,
                        //   ncp: double.tryParse(
                        //           model.selectedNumberFrequenceEat?.label ??
                        //               "") ??
                        //       0.0,
                        //   caec: model.selectedSnack?.label ?? '',
                        //   smoke: model.selectedCigarette?.label ?? "",
                        //   ch2o: double.parse(
                        //       model.selectedNumberFrequenceDrink?.label ??
                        //           ""),
                        //   scc: model.selectedCountingCalories?.label ?? "",
                        //   faf: double.parse(
                        //       model.selectedNumberFrequenceActivity?.label ??
                        //           ""),
                        //   tue: double.parse(
                        //       model.selectedNumberFrequenceUseTech?.label ??
                        //           ""),
                        //   calc: model.selectedAlcohol?.label ?? "",
                        //   mtrans: model.selectedTransportation?.label ?? "",
                        // );
                        //  Navigator.pop(context);
                      },
                      child: const Text("Submit"),
                    ),
                  ),
                  Text('Prediction Result: ${model.predictionResult}'),
                ],
              );
            },
          ),
        ),
      ),floatingActionButton: FloatingActionButton(onPressed: () {
        KonsultasiViewModel().loadCSVData();
      },
      ),
    );
  }
}
