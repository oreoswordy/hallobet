import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hallobet/model/information.dart';

class InformationViewModel extends ChangeNotifier {
  List<Information> _items = [];

  List<Information> get items => _items;

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/dummy.json');
    final data = json.decode(response);
    _items = List<Information>.from(
        data["items"].map((item) => Information.fromMap(item)));
    notifyListeners();
  }

  void initialize() {
    if (_items.isEmpty) {
      readJson();
    }
  }
}