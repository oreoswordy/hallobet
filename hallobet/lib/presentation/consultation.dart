import 'package:flutter/material.dart';
import 'package:hallobet/presentation/widget/widget.dart';

const List<String> genders = ["Laki-Laki", "Perempuan"];
const List<String> options = ["Ya", "Tidak"];
const List<String> options2 = ["Tidak", "Kadang - Kadang", "Sering", "Selalu"];

enum MakananCategory {
  choiceTidak,
  choiceKadangKadang,
  choiceSering,
  choiceSelalu,
}

extension MakananCategoryExtension on MakananCategory {
  String get label {
    switch (this) {
      case MakananCategory.choiceTidak:
        return 'Tidak';
      case MakananCategory.choiceKadangKadang:
        return 'Kadang-Kadang';
      case MakananCategory.choiceSering:
        return 'Sering';
      case MakananCategory.choiceSelalu:
        return 'Selalu';
    }
  }
}

enum OptionCategory {
  choiceYa,
  choiceTidak,
}

extension OptionCategoryExtension on OptionCategory {
  String get label {
    switch (this) {
      case OptionCategory.choiceYa:
        return 'Ya';
      case OptionCategory.choiceTidak:
        return 'Tidak';
    }
  }
}

enum GenderCategory {
  choiceLakiLaki,
  choicePerempuan,
}

extension GenderCategoryExtension on GenderCategory {
  String get label {
    switch (this) {
      case GenderCategory.choiceLakiLaki:
        return 'Laki-Laki';
      case GenderCategory.choicePerempuan:
        return 'Perempuan';
    }
  }
}

enum ScaleCategory {
  choiceKadangKadang,
  choiceSering,
  choiceSelalu,
}

extension ScaleCategoryExtension on ScaleCategory {
  String get label {
    switch (this) {
      case ScaleCategory.choiceKadangKadang:
        return 'Kadang - Kadang';
      case ScaleCategory.choiceSering:
        return 'Sering';
      case ScaleCategory.choiceSelalu:
        return 'Selalu';
    }
  }
}

enum AlcoholCategory {
  choiceTidak,
  choiceKadangKadang,
  choiceSering,
}

extension AlcoholCategoryExtension on AlcoholCategory {
  String get label {
    switch (this) {
      case AlcoholCategory.choiceTidak:
        return 'Tidak';
      case AlcoholCategory.choiceKadangKadang:
        return 'Kadang - Kadang';
      case AlcoholCategory.choiceSering:
        return 'Sering';
    }
  }
}

enum TransportationCategory {
  choiceJalan,
  choiceUmum,
  choiceMobil,
}

extension TransportationCategoryExtension on TransportationCategory {
  String get label {
    switch (this) {
      case TransportationCategory.choiceJalan:
        return 'Jalan';
      case TransportationCategory.choiceUmum:
        return 'Transportasi Umum';
      case TransportationCategory.choiceMobil:
        return 'Mobil';
    }
  }
}

class ConsultationScreen extends StatefulWidget {
  const ConsultationScreen({Key? key}) : super(key: key);

  @override
  State<ConsultationScreen> createState() => _ConsultationScreenState();
}

class _ConsultationScreenState extends State<ConsultationScreen> {
  TextEditingController jenisKelaminController = TextEditingController();
  TextEditingController usiaController = TextEditingController();
  TextEditingController height = TextEditingController();
  TextEditingController weight = TextEditingController();

  GenderCategory? selectedGender;
  OptionCategory? selectedOption1;
  OptionCategory? selectedOption;
  MakananCategory? selectedMakanan;
  MakananCategory? selectedMakanan1;
  MakananCategory? selectedMakanan2;
  OptionCategory? selectedOption2;
  OptionCategory? selectedOption3;
  MakananCategory? selectedMakanan3;
  ScaleCategory? selectedScale;
  AlcoholCategory? selectedAlcohol;
  AlcoholCategory? selectedAlcohol1;
  TransportationCategory? selectedTransportation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget("Konsultasi Tingkat Obesitas"),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              titleConsultation("Jenis Kelamin"),
              SizedBox(height: 12),
              DropdownButton<GenderCategory>(
                hint: Text("Pilih"),
                isExpanded: true,
                value: selectedGender,
                onChanged: (newValue) {
                  setState(() {
                    jenisKelaminController.text = newValue!.label;
                    selectedGender = newValue;
                  });
                },
                items: GenderCategory.values.map((choice) {
                  return DropdownMenuItem<GenderCategory>(
                    value: choice,
                    child: Text(choice.label),
                  );
                }).toList(),
              ),
              SizedBox(height: 24),
              titleConsultation("Usia"),
              SizedBox(height: 12),
              textFieldConsultation("Masukkan Usia", usiaController),
              SizedBox(height: 24),
              titleConsultation("Tinggi Badan"),
              SizedBox(height: 12),
              textFieldConsultation("Masukkan Tinggi Badan", height),
              SizedBox(height: 24),
              titleConsultation("Berat Badan"),
              SizedBox(height: 12),
              textFieldConsultation("Masukkan Berat Badan", weight),
              SizedBox(height: 24),
              titleConsultation("Apakah Anda memiliki riwayat keturunan obesitas ?"),
              SizedBox(height: 12),
              DropdownButton<OptionCategory>(
                hint: Text("Pilih"),
                isExpanded: true,
                value: selectedOption1,
                onChanged: (newValue1) {
                  setState(() {
                    selectedOption1 = newValue1!;
                  });
                },
                items: OptionCategory.values.map((choice) {
                  return DropdownMenuItem<OptionCategory>(
                    value: choice,
                    child: Text(choice.label),
                  );
                }).toList(),
              ),
              SizedBox(height: 24),
              titleConsultation("Apakah Anda mengonsumsi makanan tinggi kalori ?"),
              SizedBox(height: 12),
              DropdownButton<OptionCategory>(
                hint: Text("Pilih"),
                isExpanded: true,
                value: selectedOption,
                onChanged: (newValue) {
                  setState(() {
                    selectedOption = newValue!;
                  });
                },
                items: OptionCategory.values.map((choice) {
                  return DropdownMenuItem<OptionCategory>(
                    value: choice,
                    child: Text(choice.label),
                  );
                }).toList(),
              ),
              SizedBox(height: 24,),
              titleConsultation("Seberapa sering Anda mengonsumsi Sayuran ?"),
              SizedBox(height: 12,),
              DropdownButton<MakananCategory>(
                hint: Text('Pilih'),
                isExpanded: true,
                value: selectedMakanan,
                onChanged: (newValue) {
                  setState(() {
                    selectedMakanan = newValue!;
                  });
                },
                items: MakananCategory.values.map((choice) {
                  return DropdownMenuItem<MakananCategory>(
                    value: choice,
                    child:
                    Text(choice.label),
                  );
                }).toList(),
              ),
              SizedBox(height: 24,),
              titleConsultation("Seberapa sering anda mengonsumsi makanan dalam sehari ?"),
              SizedBox(height: 12,),
              DropdownButton<MakananCategory>(
                hint: Text('Pilih'),
                isExpanded: true,
                value: selectedMakanan1,
                onChanged: (newValue1) {
                  setState(() {
                    selectedMakanan1 = newValue1!;
                  });
                },
                items: MakananCategory.values.map((choice) {
                  return DropdownMenuItem<MakananCategory>(
                    value: choice,
                    child:
                    Text(choice.label),
                  );
                }).toList(),
              ),
              SizedBox(height: 24),
              titleConsultation("Apakah Anda mengonsumsi cemilan ?"),
              SizedBox(height: 12),
              DropdownButton<MakananCategory>(
                hint: Text("Pilih"),
                isExpanded: true,
                value: selectedMakanan2,
                onChanged: (newValue2) {
                  setState(() {
                    selectedMakanan2 = newValue2!;
                  });
                },
                items: MakananCategory.values.map((choice) {
                  return DropdownMenuItem<MakananCategory>(
                    value: choice,
                    child: Text(choice.label),
                  );
                }).toList(),
              ),
              SizedBox(height: 24),
              titleConsultation("Apakah Anda merokok ?"),
              SizedBox(height: 12),
              DropdownButton<OptionCategory>(
                hint: Text("Pilih"),
                isExpanded: true,
                value: selectedOption2,
                onChanged: (newValue2) {
                  setState(() {
                    selectedOption2 = newValue2!;
                  });
                },
                items: OptionCategory.values.map((choice) {
                  return DropdownMenuItem<OptionCategory>(
                    value: choice,
                    child: Text(choice.label),
                  );
                }).toList(),
              ),
              SizedBox(height: 24),
              titleConsultation("Seberapa sering Anda minum air putih ?"),
              SizedBox(height: 12),
              DropdownButton<ScaleCategory>(
                hint: Text("Pilih"),
                isExpanded: true,
                value: selectedScale,
                onChanged: (newValue) {
                  setState(() {
                    selectedScale = newValue!;
                  });
                },
                items: ScaleCategory.values.map((choice) {
                  return DropdownMenuItem<ScaleCategory>(
                    value: choice,
                    child: Text(choice.label),
                  );
                }).toList(),
              ),
              SizedBox(height: 24),
              titleConsultation("Apakah Anda menghitung kalori yang masuk ke dalam tubuh Anda ?"),
              SizedBox(height: 12),
              DropdownButton<OptionCategory>(
                hint: Text("Pilih"),
                isExpanded: true,
                value: selectedOption3,
                onChanged: (newValue3) {
                  setState(() {
                    selectedOption3 = newValue3!;
                  });
                },
                items: OptionCategory.values.map((choice) {
                  return DropdownMenuItem<OptionCategory>(
                    value: choice,
                    child: Text(choice.label),
                  );
                }).toList(),
              ),
              SizedBox(height: 24),
              titleConsultation("Seberapa sering Anda melakukan aktivitas fisik ?"),
              SizedBox(height: 12),
              DropdownButton<MakananCategory>(
                hint: Text("Pilih"),
                isExpanded: true,
                value: selectedMakanan3,
                onChanged: (newValue3) {
                  setState(() {
                    selectedMakanan3 = newValue3!;
                  });
                },
                items: MakananCategory.values.map((choice) {
                  return DropdownMenuItem<MakananCategory>(
                    value: choice,
                    child: Text(choice.label),
                  );
                }).toList(),
              ),
              SizedBox(height: 24),
              titleConsultation("Seberapa sering Anda menggunakan teknologi ?"),
              SizedBox(height: 12),
              DropdownButton<AlcoholCategory>(
                hint: Text("Pilih"),
                isExpanded: true,
                value: selectedAlcohol,
                onChanged: (newValue) {
                  setState(() {
                    selectedAlcohol = newValue!;
                  });
                },
                items: AlcoholCategory.values.map((choice) {
                  return DropdownMenuItem<AlcoholCategory>(
                    value: choice,
                    child: Text(choice.label),
                  );
                }).toList(),
              ),
              SizedBox(height: 24),
              titleConsultation("Seberapa sering Anda mengonsumsi alkohol ?"),
              SizedBox(height: 12),
              DropdownButton<AlcoholCategory>(
                hint: Text("Pilih"),
                isExpanded: true,
                value: selectedAlcohol1,
                onChanged: (newValue1) {
                  setState(() {
                    selectedAlcohol1 = newValue1!;
                  });
                },
                items: AlcoholCategory.values.map((choice) {
                  return DropdownMenuItem<AlcoholCategory>(
                    value: choice,
                    child: Text(choice.label),
                  );
                }).toList(),
              ),
              SizedBox(height: 24),
              titleConsultation("Transportasi apa yang Anda gunakan sehari - hari ?"),
              SizedBox(height: 12),
              DropdownButton<TransportationCategory>(
                hint: Text("Pilih"),
                isExpanded: true,
                value: selectedTransportation,
                onChanged: (newValue) {
                  setState(() {
                    selectedTransportation = newValue!;
                  });
                },
                items: TransportationCategory.values.map((choice) {
                  return DropdownMenuItem<TransportationCategory>(
                    value: choice,
                    child: Text(choice.label),
                  );
                }).toList(),
              ),
              SizedBox(height: 24),
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
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Hasil'),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Jenis Kelamin: ${jenisKelaminController.text}'),
                              Text('Usia: ${usiaController.text}'),
                              Text('Tinggi Badan: ${height.text}'),
                              Text('Berat Badan: ${weight.text}'),
                              Text('Riwayat Obesitas: ${selectedOption1?.label ?? "Belum dipilih"}'),
                              Text('Konsumsi Makanan Tinggi Kalori: ${selectedOption?.label ?? "Belum dipilih"}'),
                              Text('Konsumsi Sayuran: ${selectedMakanan?.label ?? "Belum dipilih"}'),
                              Text('Konsumsi Makanan dalam Sehari: ${selectedMakanan1?.label ?? "Belum dipilih"}'),
                              // Add more fields here as needed
                            ],
                          ),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('Selesai'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Text("Submit"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
