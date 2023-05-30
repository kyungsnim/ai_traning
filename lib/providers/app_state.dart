import 'package:flutter/material.dart';

class AppState extends ChangeNotifier {
  double _horizontalGap = 0;
  double _verticalGap = 0;
  double _interval = 50;
  double get horizontalGap => _horizontalGap;
  double get verticalGap => _verticalGap;
  double get interval => _interval;

  void horizontalPlus() {
    _horizontalGap += _interval;
    notifyListeners();
  }

  void horizontalMinus() {
    _horizontalGap -= _interval;
    notifyListeners();
  }

  void verticalPlus() {
    _verticalGap += _interval;
    notifyListeners();
  }

  void verticalMinus() {
    _verticalGap -= _interval;
    notifyListeners();
  }
}