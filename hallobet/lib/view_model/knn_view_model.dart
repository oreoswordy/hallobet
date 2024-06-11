// import 'package:ml_algo/ml_algo.dart';
// import 'package:ml_preprocessing/ml_preprocessing.dart';
// import 'package:hallobet/model/obesity.dart'; // Import your Obesity model

// class KnnViewModel {
//   KnnClassifier _classifier;

//   Future<void> train() async {
//     final data = await fromCsv('assets/obesity.csv', headerExists: true);
//     final targetName = 'target'; // The name of the target column
//     final targetIdx = data.header.indexOf(targetName);
//     final features = data.excludeColumns([targetIdx]);
//     final target = data.getColumn(targetIdx);

//     _classifier = KnnClassifier(
//       features,
//       target,
//       3, // The number of neighbors
//       kernel: gaussianKernel, // The kernel function
//       distance: Distance.euclidean, // The distance type
//     );
//   }

  // String predict(Obesity obesity) {
  //   final features = DataFrame.fromSeries([
  //     Series('genders', [obesity.genders]),
  //     Series('age', [obesity.age]),
  //     Series('height', [obesity.height]),
  //     Series('weight', [obesity.weight]),
  //     Series('familyHistoryWithOverweight', [obesity.familyHistoryWithOverweight]),
  //     Series('favc', [obesity.favc]),
  //     Series('fcvc', [obesity.fcvc]),
  //     Series('ncp', [obesity.ncp]),
  //     Series('caec', [obesity.caec]),
  //     Series('smoke', [obesity.smoke]),
  //     Series('ch2o', [obesity.ch2o]),
  //     Series('scc', [obesity.scc]),
  //     Series('faf', [obesity.faf]),
  //     Series('tue', [obesity.tue]),
  //     Series('calc', [obesity.calc]),
  //     // Add other fields as needed
  //   ]);

//     final predicted = _classifier.predict(features);

//     return predicted.first;
//   }
// }