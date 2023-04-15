import 'package:get/get.dart';

class CalculatorController extends GetxController {
  var firstNumber = '5'.obs;
  var secondNumber = '5'.obs;
  var mathResult = '10'.obs;
  var operation = '+'.obs;

  void resetAll() {
    firstNumber.value = '0';
    secondNumber.value = '0';
    mathResult.value = '0';
    operation.value = '+';
  }

  void addNumber(String number) {
    if (mathResult.value == '0') {
      mathResult.value = number;
      return;
    }

    if (mathResult.value == '-0') {
      mathResult.value = '-' + number;
      return;
    }

    // TODO: Negative numbers

    mathResult.value += number;
  }

  void toggleSign() {
    bool isNegative = mathResult.startsWith('-');
    if (isNegative) {
      mathResult.value = mathResult.value.replaceFirst('-', '');
    } else {
      mathResult.value = '-' + mathResult.value;
    }
  }

  void addDecimal() {
    if (mathResult.contains('.')) return;
    if (mathResult.value == '0') {
      mathResult.value = '0.';
    } else {
      mathResult.value = mathResult.value + '.';
    }
  }

  void selectOperation(String newOperation) {
    operation.value = newOperation;
    firstNumber.value = mathResult.value;
    mathResult.value = '0';
  }

  void deleteLastEntry() {
    int mathResultLenth = mathResult.value.replaceAll('-', '').length;
    print(mathResultLenth);
    if (mathResultLenth > 1) {
      mathResult.value =
          mathResult.value.substring(0, mathResult.value.length - 1);
    } else {
      mathResult.value = '0';
    }
  }

  void calculateResult() {
    double num1 = double.parse(firstNumber.value);
    double num2 = double.parse(mathResult.value);
    secondNumber.value = mathResult.value;
    print(operation.value);
    switch (operation.value) {
      case '+':
        mathResult.value = (num1 + num2).toStringAsFixed(5);
        break;
      case '*':
        mathResult.value = (num1 * num2).toStringAsFixed(5);
        break;
      case '-':
        mathResult.value = (num1 - num2).toStringAsFixed(5);
        break;
      case '/':
        mathResult.value = (num1 / num2).toStringAsFixed(5);
        break;
    }

    if (mathResult.endsWith('.00000')) {
      mathResult.value = double.parse(mathResult.value).toStringAsFixed(0);
    }
  }
}
