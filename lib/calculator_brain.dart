import 'package:flutter/material.dart';

class CalculatorBrain {
  CalculatorBrain(this.weight, this.height);

  final int height;
  final int weight;

  late double _bmi;

  String calculateBMI() {
    _bmi = weight / (height / 100 * height / 100);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Healthy';
    } else {
      return 'Underweight';
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'You have a higher than normal body weight. Try to exercise more.';
    } else if (_bmi > 18.5) {
      return 'You have a normal body weight. Good job!';
    } else {
      return 'You have a lower than normal body weight. You can eat a bit more.';
    }
  }

  Color getColor() {
    if (_bmi >= 25) {
      return Colors.orange;
    } else if (_bmi > 18.5) {
      return Colors.green;
    } else {
      return Colors.blue;
    }
  }
}
