import 'package:calculadora/controllers/calculator.dart';
import 'package:flutter/material.dart';

import 'package:calculadora/widgets/line_separator.dart';
import 'package:calculadora/widgets/main_result.dart';
import 'package:calculadora/widgets/sub_result.dart';
import 'package:get/get.dart';

class MathResults extends StatelessWidget {
  final calculatorCtrl = Get.put(CalculatorController());

  MathResults({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          SubResult(text: calculatorCtrl.firstNumber.value),
          SubResult(text: calculatorCtrl.operation.value),
          SubResult(text: calculatorCtrl.secondNumber.value),
          LineSeparator(),
          MainResultText(text: calculatorCtrl.mathResult.value),
        ],
      ),
    );
  }
}
