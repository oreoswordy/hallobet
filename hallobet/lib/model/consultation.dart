enum TKSS {
  choiceTidak,
  choiceKadangKadang,
  choiceSering,
  choiceSelalu,
}

extension TKSSExtension on TKSS {
  String get label {
    switch (this) {
      case TKSS.choiceTidak:
        return 'Tidak';
      case TKSS.choiceKadangKadang:
        return 'Kadang-Kadang';
      case TKSS.choiceSering:
        return 'Sering';
      case TKSS.choiceSelalu:
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

// enum GenderCategory {
//   choiceLakiLaki,
//   choicePerempuan,
// }

// extension GenderCategoryExtension on GenderCategory {
//   String get label {
//     switch (this) {
//       case GenderCategory.choiceLakiLaki:
//         return 'Laki-Laki';
//       case GenderCategory.choicePerempuan:
//         return 'Perempuan';
//     }
//   }
// }

enum KSS {
  choiceKadangKadang,
  choiceSering,
  choiceSelalu,
}

extension KSSExtension on KSS {
  String get label {
    switch (this) {
      case KSS.choiceKadangKadang:
        return 'Kadang - Kadang';
      case KSS.choiceSering:
        return 'Sering';
      case KSS.choiceSelalu:
        return 'Selalu';
    }
  }
}

enum TKS {
  choiceTidak,
  choiceKadangKadang,
  choiceSering,
}

extension TKSExtension on TKS {
  String get label {
    switch (this) {
      case TKS.choiceTidak:
        return 'Tidak';
      case TKS.choiceKadangKadang:
        return 'Kadang - Kadang';
      case TKS.choiceSering:
        return 'Sering';
    }
  }
}

// enum TransportationCategory {
//   choiceJalan,
//   choiceUmum,
//   choiceMobil,
// }

// extension TransportationCategoryExtension on TransportationCategory {
//   String get label {
//     switch (this) {
//       case TransportationCategory.choiceJalan:
//         return 'Jalan Kaki';
//       case TransportationCategory.choiceUmum:
//         return 'Transportasi Umum';
//       case TransportationCategory.choiceMobil:
//         return 'Kendaraan Pribadi';
//     }
//   }
// }

enum NumberFrequence {
  one,
  two,
  three,
  four,
  five,
  six,
  seven,
  eight,
  nine,
  ten,
}

extension NumberFrequenceExtension on NumberFrequence {
  String get label {
    switch (this) {
      case NumberFrequence.one:
        return '1';
      case NumberFrequence.two:
        return '2';
      case NumberFrequence.three:
        return '3';
      case NumberFrequence.four:
        return '4';
      case NumberFrequence.five:
        return '5';
      case NumberFrequence.six:
        return '6';
      case NumberFrequence.seven:
        return '7';
      case NumberFrequence.eight:
        return '8';
      case NumberFrequence.nine:
        return '9';
      case NumberFrequence.ten:
        return '10';
    }
  }
}

class PickOption {
  final int value;
  final String label;

  PickOption({required this.value, required this.label});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PickOption &&
          runtimeType == other.runtimeType &&
          value == other.value;

  @override
  int get hashCode => value.hashCode;

  static List<PickOption> get values => [
        PickOption(value: 1, label: '0'),
        PickOption(value: 2, label: '1'),
        PickOption(value: 3, label: '2'),
        PickOption(value: 4, label: '3'),
        PickOption(value: 5, label: 'lebih dari 3'),
      ];
}

class PickOptionYesNo {
  final int value;
  final String label;

  PickOptionYesNo({required this.value, required this.label});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PickOptionYesNo &&
          runtimeType == other.runtimeType &&
          value == other.value;

  @override
  int get hashCode => value.hashCode;

  static List<PickOptionYesNo> get values => [
        PickOptionYesNo(value: 1, label: 'Tidak'),
        PickOptionYesNo(value: 2, label: 'Ya'),
      ];
}

class PickOptionTransportation {
  final int value;
  final String label;

  PickOptionTransportation({required this.value, required this.label});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PickOptionTransportation &&
          runtimeType == other.runtimeType &&
          value == other.value;

  @override
  int get hashCode => value.hashCode;

  static List<PickOptionTransportation> get values => [
        PickOptionTransportation(value: 1, label: 'Jalan Kaki'),
        PickOptionTransportation(value: 2, label: 'Transportasi Umum'),
        PickOptionTransportation(value: 3, label: 'Kendaraan Pribadi'),
      ];
}

class PickOptionGender {
  final int value;
  final String label;

  PickOptionGender({required this.value, required this.label});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PickOptionGender &&
          runtimeType == other.runtimeType &&
          value == other.value;

  @override
  int get hashCode => value.hashCode;

  static List<PickOptionGender> get values => [
        PickOptionGender(value: 1, label: 'Pria'),
        PickOptionGender(value: 2, label: 'Wanita'),
      ];
}
