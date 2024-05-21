import 'package:flutter/material.dart';
import 'package:hallobet/view_model/view_model.dart';
import 'package:provider/provider.dart';

class CsvScreen extends StatelessWidget {
  const CsvScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Consumer<CsvViewModel>(
          builder: (context, viewModel, child) {
            if (viewModel.data.isEmpty) {
              return const Center(child: CircularProgressIndicator());
            }
            return ListView.builder(
              itemCount: viewModel.data.length,
              itemBuilder: (context, index) {
                final obesity = viewModel.data[index];
                return ListTile(
                  title: Text('${obesity.genders}, Age: ${obesity.age}'),
                  subtitle: Text(
                      'Weight: ${obesity.weight}, Height: ${obesity.height}, Family history of overweight: ${obesity.familyHistoryWithOverweight}'),
                );
              },
            );
          },
        ));
  }
}
