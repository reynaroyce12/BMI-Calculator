import 'dart:math';

class Calculator {

  final int height;
  final int weight;
  Calculator({ required this.height, required this.weight});

  double _bmi = 0;

  String calculateBmi() {
    _bmi = weight / pow(height/100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResults() {
    if (_bmi >= 25) {
      return 'OVERWEIGHT';
    } else if (_bmi > 18.5) {
      return 'NORMAL';
    } else {
      return 'UNDERWEIGHT';
    }
  }

  String getDescription() {
    if (_bmi >= 25) {
      return 'You have a higher than normal body weight. Exercise regularly to keep the body fit!';
    } else if (_bmi >= 18.5) {
      return 'You have a normal body weight. Keep up the fit!';
    } else {
      return 'You have a lower than normal body weight. You can eat a bit more!';
    }
  }

}