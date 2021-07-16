import 'package:flutter/cupertino.dart';

class HomeChangeNotifier extends ChangeNotifier {
  String display = "0";
  var operation = null;
  bool firstPress = true;
  double firstValue = 0;

  Future<void> reloadState(String pressed) async {
    double dbl(String x){
      return double.parse(x);
    }
    String dblString(String x){
      return double.parse(x).toString();
    }

    if (operation == null){

      switch(pressed){
      case "C": {
        firstValue = 0;
        display = "0";
      }break;
      case "+/-":{
        display =  (-1 * dbl(display)).toString();
      }break;
      case "%":{
        display = (dbl(display)/100).toString();
      }break;
      case "DEL":{
        display = display.substring(0,display.length-1);
      }break;
      case "/":{
        operation = "/";
        firstValue = dbl(display);
      } break;
      case "+":{
        operation = "+";
        firstValue = dbl(display);
      } break;
      case "-":{
        operation = "-";
        firstValue = dbl(display);
      } break;
      case "X":{
        operation = "X";
        firstValue = dbl(display);
      } break;
        case "=":{
          print ("wala namang operation hatdog");
        }break;
      default: {
        display = display+pressed;
      }
    }
    }else{
      switch(pressed) {
        case "C":{
            firstValue = 0;
            display = "0";
            operation = null;
          }break;
        case "+/-":{
          if (firstPress){}else {
            display = (-1 * dbl(display)).toString();
          }
        }break;
        case "%":{
          if(firstPress){}else {
            display = (dbl(display) / 100).toString();
          }
        }break;
        case "DEL":{
          if(firstPress){}else {
            display = display.substring(0, display.length - 1);
          }
        }break;
        case "/":{
          print("Press C to clear and change operations.");
        } break;
        case "+":{
          print("Press C to clear and change operations.");
        } break;
        case "-":{
          print("Press C to clear and change operations.");
        } break;
        case "X":{
          print("Press C to clear and change operations.");
        } break;
        case "=":{
          switch(operation){
            case "+":{
              display = (firstValue + dbl(display)).toString();
            }break;
            case "-":{
              display = (firstValue - dbl(display)).toString();
            }break;
            case "X":{
              display = (firstValue * dbl(display)).toString();
            }break;
            case "/":{
              display = (firstValue / dbl(display)).toString();
            }break;
          }
          firstPress = true;
          operation = null;
        }break;
        default: {
          if(firstPress){
            display = "";
          }
          display = display+pressed;
          firstPress = false;
        }
      }
    }
  notifyListeners();
  }
}