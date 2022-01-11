import 'dart:math';

class Calc_brain {
  final int bweight;
  final int bheight;
  late double bmi;
  Calc_brain({required this.bheight, required this.bweight});

  String bmiResult() {
    bmi = (bweight) / pow(bheight / 100, 2);
    return bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (bmi >= 25) {
      return 'overweight';
    } else if (bmi > 18) {
      return 'normal';
    } else {
      return 'underweight';
    }
  }

  String interpretation() {
    if (bmi >= 25) {
      return 'You have higher than Normal body weight. Try to exercise more.';
    } else if (bmi > 18) {
      return 'You have Normal body weight. Welldone!';
    } else {
      return 'You have lower than Normal body weight. Focus on ur diet & exercise';
    }
  }
}
