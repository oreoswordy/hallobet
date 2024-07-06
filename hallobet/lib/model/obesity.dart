class Obesity {
  int genders; // Gender of the individual
  int age; // Age of the individual
  double height; // Height of the individual in cm or other units
  double weight; // Weight of the individual in kg or other units
  int familyHistoryWithOverweight; // Family history of overweight (e.g., yes/no)
  int favc; // Frequent consumption of high caloric food (e.g., yes/no)
  int fcvc; // Frequency of vegetable consumption (e.g., times per week)
  int ncp; // Number of main meals per day
  int caec; // Consumption of food between meals (e.g., yes/no)
  int smoke; // Smoking habit (e.g., yes/no)
  int ch2o; // Consumption of water daily (e.g., liters per day)
  int scc; // Calorie consumption monitoring (e.g., yes/no)
  int faf; // Frequency of physical activity (e.g., times per week)
  int tue; // Time spent on technology devices (e.g., hours per day)
  int calc; // Consumption of alcohol (e.g., yes/no)
  int mtrans; // Mode of transportation (e.g., walking, cycling, driving)
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
      genders: data[0] as int ?? 0,
      age: data[1] as int ?? 0,
      height: data[2] as double ?? 0.0,
      weight: data[3] as double ?? 0.0,
      familyHistoryWithOverweight: data[4] as int ?? 0,
      favc: data[5] as int ?? 0,
      fcvc: data[6] as int ?? 0,
      ncp: data[7] as int ?? 0,
      caec: data[8] as int ?? 0,
      smoke: data[9] as int ?? 0,
      ch2o: data[10] as int ?? 0,
      scc: data[11] as int ?? 0,
      faf: data[12] as int ?? 0,
      tue: data[13] as int ?? 0,
      calc: data[14] as int ?? 0,
      mtrans: data[15] as int ?? 0,
      nObeyesdad: data[16] as String,
    );
  }
}
