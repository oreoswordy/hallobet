enum TKSS {
  choiceno,
  choiceKadangKadang,
  choiceSering,
  choiceSelalu,
}

extension TKSSExtension on TKSS {
  String get label {
    switch (this) {
      case TKSS.choiceno:
        return 'no';
      case TKSS.choiceKadangKadang:
        return 'Sometimes';
      case TKSS.choiceSering:
        return 'Frequently';
      case TKSS.choiceSelalu:
        return 'Always';
    }
  }
}

enum OptionCategory {
  choiceyes,
  choiceno,
}

extension OptionCategoryExtension on OptionCategory {
  String get label {
    switch (this) {
      case OptionCategory.choiceyes:
        return 'yes';
      case OptionCategory.choiceno:
        return 'no';
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
        return 'Sometimes';
      case KSS.choiceSering:
        return 'Frequently';
      case KSS.choiceSelalu:
        return 'Always';
    }
  }
}

enum TKS {
  choiceno,
  choiceKadangKadang,
  choiceSering,
}

extension TKSExtension on TKS {
  String get label {
    switch (this) {
      case TKS.choiceno:
        return 'no';
      case TKS.choiceKadangKadang:
        return 'Sometimes';
      case TKS.choiceSering:
        return 'Frequently';
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
//         return 'Walking';
//       case TransportationCategory.choiceUmum:
//         return 'Public_Transportation';
//       case TransportationCategory.choiceMobil:
//         return 'Automobile';
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
        PickOption(value: 0, label: '0'),
        PickOption(value: 1, label: '1'),
        PickOption(value: 2, label: '2'),
        PickOption(value: 3, label: '3'),
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
        PickOptionYesNo(value: 1, label: 'no'),
        PickOptionYesNo(value: 2, label: 'yes'),
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
        PickOptionTransportation(value: 1, label: 'Walking'),
        PickOptionTransportation(value: 2, label: 'Public_Transportation'),
        PickOptionTransportation(value: 3, label: 'Automobile'),
        PickOptionTransportation(value: 4, label: 'Motorbike'),
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
        PickOptionGender(value: 1, label: 'Male'),
        PickOptionGender(value: 2, label: 'Female'),
      ];
}
