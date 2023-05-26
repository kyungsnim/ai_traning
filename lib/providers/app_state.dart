import 'package:flutter/material.dart';

class AppState extends ChangeNotifier {
  double _gap = 0;
  double _interval = 50;
  double get gap => _gap;
  double get interval => _interval;
  void plus() {
    _gap += _interval;
    notifyListeners();
  }

  void minus() {
    _gap -= _interval;
    notifyListeners();
  }
}