import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

import 'home_view_model.dart';

T useChangeNotifierListenable<T extends ChangeNotifier>(T data){
  final state = useState<T>(data);
  return useListenable(state.value);
}

class HomeView extends HookWidget{

  @override
  Widget build(BuildContext context) {
    final homeChangeNotifier = useChangeNotifierListenable(HomeChangeNotifier());
    return Scaffold(
      appBar: AppBar(

        title: Text("Calculator"),
      ),
      body:
      Column(
        children:[
          Row(
            children:[
            Expanded(
              child:
              Container(
                color: Colors.grey,
                alignment: Alignment.bottomRight,
                child: Text("${homeChangeNotifier.display}"),
                height: 70,
              ),
            ),
            ]
          ),
          Expanded(
          child:
        Table(
          border: TableBorder.all(),
          columnWidths: const <int, TableColumnWidth>{
            0: FlexColumnWidth(),
            1: FlexColumnWidth(),
            2: FlexColumnWidth(),
            3: FlexColumnWidth(),
          },
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          children: <TableRow>[
            TableRow(
              children: <Widget>[
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: InkWell(
                    onTap: (){_buttonPressed(homeChangeNotifier, "C");},
                    child:
                      Container(
                        height: 64,
                        alignment: Alignment.center,
                        child: Text("C"),
                  ),
                ),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                child: InkWell(
                  onTap: (){_buttonPressed(homeChangeNotifier, "+/-");},
                  child: Container(
                    height: 64,
                    alignment: Alignment.center,
                    child: Text("+/-"),
                  ),
                ),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: InkWell(
                    onTap: (){_buttonPressed(homeChangeNotifier, "%");},
                    child: Container(
                      height: 64,
                      alignment: Alignment.center,
                      child: Text("%"),
                  ),
                ),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: InkWell(
                    onTap: (){_buttonPressed(homeChangeNotifier, "DEL");},
                    child: Container(
                      height: 64,
                      alignment: Alignment.center,
                      child: Text("DEL"),
                  ),
                ),
                ),
              ],
            ),
            TableRow(
              children: <Widget>[
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: InkWell(
                    onTap: (){_buttonPressed(homeChangeNotifier, "7");},
                    child: Container(
                      height: 64,
                      alignment: Alignment.center,
                      child: Text("7"),
                    ),
                ),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: InkWell(
                    onTap: (){_buttonPressed(homeChangeNotifier, "8");},
                    child: Container(
                      height: 64,
                      alignment: Alignment.center,
                      child: Text("8"),
                    ),
                ),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: InkWell(
                    onTap: (){_buttonPressed(homeChangeNotifier, "9");},
                    child: Container(
                      height: 64,
                      alignment: Alignment.center,
                      child: Text("9"),
                   ),
                ),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: InkWell(
                    onTap: (){_buttonPressed(homeChangeNotifier, "/");},
                    child: Container(
                      color: Colors.amber,
                      height: 64,
                      alignment: Alignment.center,
                      child: Text("/"),
                    ),
                  ),
                ),
              ],
            ),
            TableRow(
              children: <Widget>[
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: InkWell(
                    onTap: (){_buttonPressed(homeChangeNotifier, "4");},
                    child: Container(
                      height: 64,
                      alignment: Alignment.center,
                      child: Text("4"),
                    ),
                ),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: InkWell(
                  onTap: (){_buttonPressed(homeChangeNotifier, "5");},
                  child:
                    Container(
                      height: 64,
                      alignment: Alignment.center,
                      child: Text("5"),
                    ),
                ),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: InkWell(
                  onTap: (){_buttonPressed(homeChangeNotifier, "6");},
                  child:
                    Container(
                      height: 64,
                      alignment: Alignment.center,
                      child: Text("6"),
                    ),
                ),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: InkWell(
                  onTap: (){_buttonPressed(homeChangeNotifier, "X");},
                  child:
                    Container(
                      color: Colors.amber,
                      height: 64,
                      alignment: Alignment.center,
                      child: Text("X"),
                    ),
                ),
                ),
              ],
            ),
            TableRow(
              children: <Widget>[
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: InkWell(
                    onTap: (){_buttonPressed(homeChangeNotifier, "1");},
                    child:
                    Container(
                      height: 64,
                      alignment: Alignment.center,
                      child: Text("1"),
                    ),
                  ),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                child: InkWell(
                  onTap: (){_buttonPressed(homeChangeNotifier, "2");},
                  child:
                    Container(
                      height: 64,
                      alignment: Alignment.center,
                      child: Text("2"),
                    ),
                ),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                child: InkWell(
                  onTap: (){_buttonPressed(homeChangeNotifier, "3");},
                  child:
                    Container(
                      height: 64,
                      alignment: Alignment.center,
                      child: Text("3"),
                    ),
                ),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                child: InkWell(
                  onTap: (){_buttonPressed(homeChangeNotifier, "-");},
                  child:
                    Container(
                      color: Colors.amber,
                      height: 64,
                      alignment: Alignment.center,
                      child: Text("-"),
                    ),
                ),
                ),
              ],
            ),
            TableRow(
              children: <Widget>[
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: InkWell(
                    onTap: (){_buttonPressed(homeChangeNotifier, "0");},
                    child:
                    Container(
                      height: 64,
                      alignment: Alignment.center,
                      child: Text("0"),
                    ),
                ),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: InkWell(
                    onTap: (){_buttonPressed(homeChangeNotifier, ".");},
                    child:
                      Container(
                        height: 64,
                        alignment: Alignment.center,
                        child: Text("."),
                      ),
                ),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: InkWell(
                    onTap: (){_buttonPressed(homeChangeNotifier, "=");},
                    child:
                    Container(
                      color: Colors.amber,
                      height: 64,
                      alignment: Alignment.center,
                      child: Text("="),
                    ),
                ),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: InkWell(
                    onTap: (){_buttonPressed(homeChangeNotifier, "+");},
                    child:
                      Container(
                        color: Colors.amber,
                        height: 64,
                        alignment: Alignment.center,
                        child: Text("+"),
                      ),
                ),
                ),
              ],
            ),
    ],
      ),
        ),
    ],
      ),
    );
  }
}

  Future<void> _buttonPressed(HomeChangeNotifier homeChangeNotifier, String pressed) async{
    homeChangeNotifier.reloadState(pressed);
  }

// Text(
//  'You have pushed the button this many times:',
// ),
// Text(
//  '${homeChangeNotifier.increment}',
//  style: Theme.of(context).textTheme.headline4,
// ),
// floatingActionButton: FloatingActionButton(
//         onPressed: () async{
//           _incrementCounter(homeChangeNotifier);
//         },
//         tooltip: 'Increment',
//         child: Icon(Icons.add),
//       ),