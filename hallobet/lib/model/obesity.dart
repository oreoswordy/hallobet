class Obesity {
  String genders; // Gender of the individual
  double age; // Age of the individual
  double height; // Height of the individual in cm or other units
  double weight; // Weight of the individual in kg or other units
  String familyHistoryWithOverweight; // Family history of overweight (e.g., yes/no)
  String favc; // Frequent consumption of high caloric food (e.g., yes/no)
  int fcvc; // Frequency of vegetable consumption (e.g., times per week)
  double ncp; // Number of main meals per day
  String caec; // Consumption of food between meals (e.g., yes/no)
  String smoke; // Smoking habit (e.g., yes/no)
  double ch2o; // Consumption of water daily (e.g., liters per day)
  String scc; // Calorie consumption monitoring (e.g., yes/no)
  double faf; // Frequency of physical activity (e.g., times per week)
  double tue; // Time spent on technology devices (e.g., hours per day)
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
      age: data[1] as double ?? 0,
      height: data[2] as double ?? 0.0,
      weight: data[3] as double ?? 0.0,
      familyHistoryWithOverweight: data[4] as String,
      favc: data[5] as String,
      fcvc: data[6] as int ?? 0,
      ncp: data[7] as double ?? 0,
      caec: data[8] as String,
      smoke: data[9] as String,
      ch2o: data[10] as double ?? 0,
      scc: data[11] as String,
      faf: data[12] as double ?? 0,
      tue: data[13] as double ?? 0,
      calc: data[14] as String,
      mtrans: data[15] as String,
      nObeyesdad: data[16] as String,
    );
  }
}
