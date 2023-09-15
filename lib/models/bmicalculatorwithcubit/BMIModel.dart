import 'package:flutter/material.dart';

class BMIModel {
  double height;
  double weight;
  double? result;
  int age;
  String? gender;

  BMIModel.setBMI(this.height, this.weight, this.age);

  void calculateBMI() {
    double h = height / 100;
    result = weight / (h * h);
  }

  String getBMIStatus() {
    if (result == null) {
      return "N/A";
    } else if (result! < 18.5) {
      return "Underweight";
    } else if (result! >= 18.5 && result! < 24.9) {
      return "Normal";
    } else if (result! >= 25 && result! < 29.9) {
      return "Overweight";
    } else {
      return "Obese";
    }
  }

  Color getBMIColor() {
    String status = getBMIStatus();
    switch (status) {
      case "Underweight":
        return Colors.blue;
      case "Normal":
        return Colors.green;
      case "Overweight":
        return Colors.orange;
      case "Obese":
        return Colors.red;
      default:
        return Colors.white;
    }
  }
}
