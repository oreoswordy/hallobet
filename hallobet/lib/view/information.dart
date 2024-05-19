import 'package:flutter/material.dart';
import 'package:hallobet/view/detail_information.dart';
import 'package:hallobet/view_model/view_model.dart';
import 'package:provider/provider.dart';
import 'package:hallobet/view/widget/widget.dart';

class InformationScreen extends StatelessWidget {
  const InformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget("Informasi Kesehatan"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Consumer<InformationViewModel>(
              builder: (context, viewModel, child) {
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: viewModel.items.length,
                  itemBuilder: (context, index) {
                    final item = viewModel.items[index];
                    return cardInformation(() {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailInformation(
                                title: item.title,
                                image:
                                    "https://media.istockphoto.com/id/1314797892/id/foto/obesitas-berat-badan-tidak-sehat-ahli-gizi-memeriksa-pinggang-wanita-menggunakan-pita-meter.jpg?s=612x612&w=0&k=20&c=ydZ4-lwelbRe7twM2KOyIa_qnSf85kiSrQ5Z53dLfYI=",
                                desc: item.description),
                          ));
                    },
                        context,
                        "https://media.istockphoto.com/id/1314797892/id/foto/obesitas-berat-badan-tidak-sehat-ahli-gizi-memeriksa-pinggang-wanita-menggunakan-pita-meter.jpg?s=612x612&w=0&k=20&c=ydZ4-lwelbRe7twM2KOyIa_qnSf85kiSrQ5Z53dLfYI=",
                        item.title,
                        item.description);
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
