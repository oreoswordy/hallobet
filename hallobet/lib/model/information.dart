import 'dart:convert';

class Information {
  String title;
  String description;
  String image; 
  Information({
    required this.title,
    required this.description,
    required this.image,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'image': image,
    };
  }

  factory Information.fromMap(Map<String, dynamic> map) {
    return Information(
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      image: map['image'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Information.fromJson(String source) => Information.fromMap(json.decode(source));
}
