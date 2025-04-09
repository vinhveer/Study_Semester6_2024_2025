import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CalculateController extends GetxController {
  final TextEditingController oneController = TextEditingController();
  final TextEditingController twoController = TextEditingController();
  final List<String> results = [];

  void updateResult(String result) {
      results.add(result);
      update();
  }

  void multiply() {
    double number1 = double.tryParse(oneController.text) ?? 0;
    double number2 = double.tryParse(twoController.text) ?? 0;

    updateResult("${number1.toStringAsFixed(0)} ✕ ${number2.toStringAsFixed(0)} = ${number1 * number2}");
  }

  void divide() {
    double number1 = double.tryParse(oneController.text) ?? 0;
    double number2 = double.tryParse(twoController.text) ?? 0;

    String result = "";

    if (number2 == 0) {
      result = "Cannot divide by zero";
    } else {
      double calc = number1 / number2;
      result = calc.toString();
    }

    updateResult("${number1.toStringAsFixed(0)} / ${number2.toStringAsFixed(0)} = ${result}");
  }
}