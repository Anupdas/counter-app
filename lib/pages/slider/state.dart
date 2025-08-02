import 'package:flutter/material.dart';

class SliderState with ChangeNotifier {
  double _sliderValue = 0.0;
  double get sliderValue => _sliderValue;
  void setSliderValue(double value) {
    _sliderValue = value;
    notifyListeners();
  }

  void reset() {
    _isLeft = false;
    setSliderValue(0.5);
  }

  bool _isLeft = false;
  bool get isLeft => _isLeft;
  bool get isRight => !_isLeft;
  void setLeftSelected(bool value) {
    _isLeft = value;
    notifyListeners();
  }
}
