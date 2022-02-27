import 'package:flutter/material.dart';

/*
*  const meraText = Text('Hello Text 1');
    const meraText2 = Text('Hello Text 2');
    List<Widget> allWidgets = [
      meraText,
      meraText2
    ];

    for(var widget in allWidgets){
      if(widget is StatelessWidget){
        (widget as StatelessWidget).build(context);
      }else if(widget is StatefulWidget){

      }
    }
* */

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<HomeScreen> {
  String message = 'Hello world';
  bool isColorRed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isColorRed ? Colors.red : Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              message,
              style: TextStyle(fontSize: 65),
            ),
            Text(
              message,
              style: TextStyle(fontSize: 65),
            ),
            Text(
              message,
              style: TextStyle(fontSize: 65),
            ),
            ElevatedButton(
              child: const Text('Update Ttext'),
              onPressed: updateName,
            )
          ],
        ),
      ),
    );
  }

  updateName() {
    setState(updateState);
  }

  updateState() {
    message = "Hogya update :D";
    isColorRed = !isColorRed;
  }
}
