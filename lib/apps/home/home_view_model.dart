import 'package:flutter/cupertino.dart';
import 'package:math_expressions/math_expressions.dart';
class HomeChangeNotifier extends ChangeNotifier {
  String display = "";
  String answer = "0";
  void equalPressed() {
    String finaluserinput = display;
    finaluserinput = display.replaceAll('x', '*');

    Parser p = Parser();
    Expression exp = p.parse(finaluserinput);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    answer = eval.toString();
  }
  Future<void> reloadState(String pressed) async {
    double dbl(String x) {
      return double.parse(x);
    }
    switch (pressed) {
      case "C":
        {
          display = "";
          answer = "0";
        }
        break;
      case "+/-":
        {
          print("why so negative");
          try{
            //if possible, negate the current value; if not, just add a negative sign to the input
          display = (-1 * dbl(display)).toString();}catch(Exception){display+="-";}
        }
        break;
      case "%":
        {
            display+="%";
        }
        break;
      case "DEL":
        {
          display = display.substring(0, display.length - 1);
        }
        break;
      case "=":
        {
          equalPressed();
        }
        break;
      default:
        {
          display = display + pressed;
        }
    }
    notifyListeners();
  }
}