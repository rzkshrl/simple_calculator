// ignore_for_file: unnecessary_overrides

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:math_expressions/math_expressions.dart';

class HomeController extends GetxController {
  var userInput = ''.obs;
  var answer = ''.obs;

  final List<String> buttons = [
    'C', //0
    '÷', //1
    'x', //2
    '⌫', //3
    '7', //4
    '8', //5
    '9', //6
    '-', //7
    '4', //8
    '5', //9
    '6', //10
    '+', //11
    '1', //12
    '2', //13
    '3', //14
    '=', //15
    '%', //16
    '0', //17
    '.', //18
  ];

  Future<void> equalPressed() async {
    String finalUserInput = userInput.value;
    finalUserInput = userInput.replaceAll('x', '*').replaceAll('÷', '/');

    Parser p = Parser();
    Expression exp = p.parse(finalUserInput);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    answer.value = eval.toString();
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
