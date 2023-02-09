import 'dart:math';

import 'package:flutter/cupertino.dart';

class calculatorBrain {
  calculatorBrain({@required this.height, @required this.weight});
  int height;
  int weight;
  double _bmi;
  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return "Overweigth";
    } else if (_bmi > 18.5) {
      return "Normal";
    } else {
      return "Underweight";
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return "You are heigher than normal body weight. Try to exercise more";
    } else if (_bmi > 18.5) {
      return "You have normal body Weight. Good job";
    } else {
      return "You have normal body weight. You can eat a bit more.";
    }
  }
}
