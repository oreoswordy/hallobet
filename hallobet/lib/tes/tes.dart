import 'package:flutter/material.dart';
import 'package:ml_algo/ml_algo.dart';
import 'package:ml_dataframe/ml_dataframe.dart';
import 'package:csv/csv.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Obesity KNN',
      home: ObesityForm(),
    );
  }
}

class ObesityForm extends StatefulWidget {
  @override
  _ObesityFormState createState() => _ObesityFormState();
}

class _ObesityFormState extends State<ObesityForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  String gender = 'Male';
  String familyHistory = 'yes';
  String fsm = 'yes';
  String calcons = 'yes';
  String smk = 'no';
  String hrs = 'yes';

  String result = "";

  void _predict() async {
    // Load the dataset
    final rawCsv = await DefaultAssetBundle.of(context).loadString('assets/obesity_dataset.csv');
    final List<List<dynamic>> csvTable = CsvToListConverter().convert(rawCsv);

    // Convert to DataFrame
    final header = csvTable[0].map((e) => e.toString()).toList();
    final data = csvTable.sublist(1);
    final df = DataFrame.fromMatrix(data, header: header);

    // Scale the data (StandardScaler equivalent)
    final scaler = StandardScaler();
    final scaledData = scaler.fitTransform(df);

    // Define the input feature names and target name
    final featureNames = ['Gender','Age','Height','Weight','family_history_with_overweight','FAVC','FCVC','NCP','CAEC','SMOKE','CH2O','SCC','FAF','TUE','CALC','MTRANS','NObeyesdad'];
    final targetName = 'NObeyesdad';

    // Prepare the input data
    final inputRow = DataFrame.fromRows([
      [
        gender,
        double.parse(ageController.text),
        double.parse(heightController.text),
        double.parse(weightController.text),
        familyHistory,
        fsm,
        calcons,
        smk,
        hrs
      ]
    ], header: featureNames);

    final scaledInput = scaler.transform(inputRow);

    // Train the KNN model
    final knn = KnnClassifier(
      scaledData,
      targetName,
      5,
      distance: Distance.euclidean,
    );

    // Make the prediction
    final prediction = knn.predict(scaledInput).toMatrix();

    setState(() {
      result = prediction[0][0].toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Obesity KNN Predictor'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              DropdownButtonFormField<String>(
                value: gender,
                onChanged: (value) {
                  setState(() {
                    gender = value!;
                  });
                },
                items: ['Male', 'Female'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                decoration: InputDecoration(labelText: 'Gender'),
              ),
              TextFormField(
                controller: ageController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Age'),
              ),
              TextFormField(
                controller: heightController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Height (cm)'),
              ),
              TextFormField(
                controller: weightController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Weight (kg)'),
              ),
              DropdownButtonFormField<String>(
                value: familyHistory,
                onChanged: (value) {
                  setState(() {
                    familyHistory = value!;
                  });
                },
                items: ['yes', 'no'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                decoration: InputDecoration(labelText: 'Family History'),
              ),
              DropdownButtonFormField<String>(
                value: fsm,
                onChanged: (value) {
                  setState(() {
                    fsm = value!;
                  });
                },
                items: ['yes', 'no'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                decoration: InputDecoration(labelText: 'FSM'),
              ),
              DropdownButtonFormField<String>(
                value: calcons,
                onChanged: (value) {
                  setState(() {
                    calcons = value!;
                  });
                },
                items: ['yes', 'no'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                decoration: InputDecoration(labelText: 'Caloric Consumption'),
              ),
              DropdownButtonFormField<String>(
                value: smk,
                onChanged: (value) {
                  setState(() {
                    smk = value!;
                  });
                },
                items: ['yes', 'no'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                decoration: InputDecoration(labelText: 'Smoking Habit'),
              ),
              DropdownButtonFormField<String>(
                value: hrs,
                onChanged: (value) {
                  setState(() {
                    hrs = value!;
                  });
                },
                items: ['yes', 'no'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                decoration: InputDecoration(labelText: 'HRS'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _predict,
                child: Text('Submit'),
              ),
              SizedBox(height: 20),
              Text(
                'Result: $result',
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
