  import 'package:flutter/material.dart';
  import 'package:hallobet/presentation/widget/widget.dart';

  const List<String> genders = <String> ["Laki-Laki", "Perempuan"];
  const List<String> options = <String> ["Ya", "Tidak"];

  class ConsultationScreen extends StatefulWidget {
    const ConsultationScreen({super.key});

    @override
    State<ConsultationScreen> createState() => _ConsultationScreenState();
  }

  class _ConsultationScreenState extends State<ConsultationScreen> {
    String dropdownGenders = genders.first;
    String dropdownOptions = options.first;
    TextEditingController age = TextEditingController();
    TextEditingController height = TextEditingController();
    TextEditingController weight = TextEditingController();

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
                DropdownButton<String>(
                  hint: Text("Pilih Jenis Kelamin"),
                  isExpanded: true,
                  value: dropdownGenders,
                  items: genders.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    setState(() {
                      dropdownGenders = value!;
                    });
                  },
                ),
                SizedBox(height: 24),
                titleConsultation("Usia"),
                SizedBox(height: 12),
                textFieldConsultation("Masukkan Usia", age),
                SizedBox(height: 24),
                titleConsultation("Tinggi Badan"),
                SizedBox(height: 12),
                textFieldConsultation("Masukkan Tinggi Badan", height),
                SizedBox(height: 24),
                titleConsultation("Berat Badan"),
                SizedBox(height: 12),
                textFieldConsultation("Masukkan Berat Badan", weight),
                SizedBox(height: 24),
                titleConsultation("Riwayat Keturun Obesitas"),
                SizedBox(height: 12),
                DropdownButton<String>(
                  hint: Text("Pilih Riwayat Keturunan Obesitas"),
                  isExpanded: true,
                  value: dropdownOptions,
                  items: options.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    setState(() {
                      dropdownOptions = value!;
                    });
                  },
                ),
                SizedBox(height: 24),
                titleConsultation("Apakah mengonsumsi Makanan Tinggi Kalori?"),
                SizedBox(height: 12),
                DropdownButton<String>(
                  hint: Text("Apakah mengonsumsi Makanan Tinggi Kalori?"),
                  isExpanded: true,
                  value: dropdownOptions,
                  items: options.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    setState(() {
                      dropdownOptions = value!;
                    });
                  },
                ),
                SizedBox(height: 24),
                Container(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder()
                    ),
                    onPressed: () {
                    showDialog(context: context, builder: (context) {
                      return AlertDialog(
                        title: const Text('Hasil'),
                        content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('This is a demo alert dialog.'),
                Text('Would you like to approve of this message?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Selesai'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
                      );
                    },);
                  }, child: Text("Submit"),),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }