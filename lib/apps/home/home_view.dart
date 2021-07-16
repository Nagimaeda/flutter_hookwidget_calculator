import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter/material.dart';
import 'buttons.dart';
import 'home_view_model.dart';

T useChangeNotifierListenable<T extends ChangeNotifier>(T data){
  final state = useState<T>(data);
  return useListenable(state.value);
}
// Array of button
final List<String> buttons = [
  'C',
  '+/-',
  '%',
  'DEL',
  '7',
  '8',
  '9',
  '/',
  '4',
  '5',
  '6',
  'x',
  '1',
  '2',
  '3',
  '-',
  '0',
  '.',
  '=',
  '+',
];

class HomeView extends HookWidget{
  @override
  Widget build(BuildContext context) {
    final homeChangeNotifier = useChangeNotifierListenable(HomeChangeNotifier());
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Calculator"),
      ),
      backgroundColor: Colors.white38,
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(20),
                      alignment: Alignment.centerRight,
                      child: Text(
                        "${homeChangeNotifier.display}",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(15),
                      alignment: Alignment.centerRight,
                      child: Text(
                        "${homeChangeNotifier.answer}",
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ]),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              child: GridView.builder(
                  itemCount: buttons.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4),
                  itemBuilder: (BuildContext context, int index) {
                    //equal button
                    if (index == 18) {
                      return MyButton(
                        buttontapped: () {
                          _buttonPressed(homeChangeNotifier, buttons[index]);
                        },
                        buttonText: buttons[index],
                        color: Colors.orange[700],
                        textColor: Colors.white,
                      );
                    }

                    //  other buttons
                    else {
                      return MyButton(
                        buttontapped: () {
                          _buttonPressed(homeChangeNotifier, buttons[index]);
                        },
                        buttonText: buttons[index],
                        color: isOperator(buttons[index])
                            ? Colors.blueAccent
                            : Colors.white,
                        textColor: isOperator(buttons[index])
                            ? Colors.white
                            : Colors.black,
                      );
                    }
                  }), // GridView.builder
            ),
          ),
        ],
      ),
    );
  }
}
  bool isOperator(String x) {
  if (x == '/' || x == 'x' || x == '-' || x == '+' || x == '=') {
  return true;
  }
  return false;
  }

  Future<void> _buttonPressed(HomeChangeNotifier homeChangeNotifier, String pressed) async{
  print("button pressed");
    homeChangeNotifier.reloadState(pressed);
  }