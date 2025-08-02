import 'package:flutter/material.dart';

class SliderState with ChangeNotifier {
  double _sliderValue = 0.5;
  double get sliderValue => _sliderValue;
  void setSliderValue(double value) {
    _sliderValue = value;
    notifyListeners();
  }

  void reset() {
    _groupValue = 'Left';
    setSliderValue(0.5);
  }

  String _groupValue = 'Left';
  String get groupValue => _groupValue;
  void setGroupValue(String value) {
    _groupValue = value;
    notifyListeners();
  }

  bool get isLeft => _groupValue == 'Left';
  bool get isRight => _groupValue == 'Right';
}
