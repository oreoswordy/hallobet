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
                                image: item.image,
                                desc: item.description),
                          ));
                    }, context, item.image, item.title, item.description);
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
