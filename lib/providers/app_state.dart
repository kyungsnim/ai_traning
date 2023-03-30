import 'package:flutter/material.dart';

class AppState extends ChangeNotifier {
  bool _isCameraOn = false;

  bool get isCameraOn => _isCameraOn;

  void changeCameraMode() {
    _isCameraOn = !_isCameraOn;
    notifyListeners();
  }
}