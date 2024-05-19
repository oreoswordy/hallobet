class Obesity {
  String genders; // Gender of the individual
  int age; // Age of the individual
  double height; // Height of the individual in cm or other units
  double weight; // Weight of the individual in kg or other units
  String
      familyHistoryWithOverweight; // Family history of overweight (e.g., yes/no)
  String favc; // Frequent consumption of high caloric food (e.g., yes/no)
  int fcvc; // Frequency of vegetable consumption (e.g., times per week)
  int ncp; // Number of main meals per day
  String caec; // Consumption of food between meals (e.g., yes/no)
  String smoke; // Smoking habit (e.g., yes/no)
  int ch2o; // Consumption of water daily (e.g., liters per day)
  String scc; // Calorie consumption monitoring (e.g., yes/no)
  int faf; // Frequency of physical activity (e.g., times per week)
  int tue; // Time spent on technology devices (e.g., hours per day)
  String calc; // Consumption of alcohol (e.g., yes/no)
  String mtrans; // Mode of transportation (e.g., walking, cycling, driving)
  String nObeyesdad; // Nutritional diagnosis (e.g., overweight, normal weight)

  // Constructor for initializing the fields
  Obesity({
    required this.genders,
    required this.age,
    required this.height,
    required this.weight,
    required this.familyHistoryWithOverweight,
    required this.favc,
    required this.fcvc,
    required this.ncp,
    required this.caec,
    required this.smoke,
    required this.ch2o,
    required this.scc,
    required this.faf,
    required this.tue,
    required this.calc,
    required this.mtrans,
    required this.nObeyesdad,
  });

  factory Obesity.fromList(List<dynamic> data) {
    return Obesity(
      genders: data[0] as String,
      age: int.tryParse(data[1].toString()) ?? 0,
      height: double.tryParse(data[2].toString()) ?? 0.0,
      weight: double.tryParse(data[3].toString()) ?? 0.0,
      familyHistoryWithOverweight: data[4] as String,
      favc: data[5] as String,
      fcvc: int.tryParse(data[6].toString()) ?? 0,
      ncp: int.tryParse(data[7].toString()) ?? 0,
      caec: data[8] as String,
      smoke: data[9] as String,
      ch2o: int.tryParse(data[10].toString()) ?? 0,
      scc: data[11] as String,
      faf: int.tryParse(data[12].toString()) ?? 0,
      tue: int.tryParse(data[13].toString()) ?? 0,
      calc: data[14] as String,
      mtrans: data[15] as String,
      nObeyesdad: data[16] as String,
    );
  }
}
