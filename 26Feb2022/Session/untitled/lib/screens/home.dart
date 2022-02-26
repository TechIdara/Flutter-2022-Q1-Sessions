import 'package:flutter/material.dart';
import 'package:layouts_app/screens/parts/scrolling_view.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 5,
            child: ScrollingView(),
          ),
          Container(
            height: 50,
            color: Colors.blue,
            child: Row(
              children: [
                ,
                Expanded(
                    child: Container(
                      child: Row(
                        children: [
                          Icon(Icons.add),
                          TextField(
                            onChanged: (text){

                            },
                  decoration: InputDecoration(
                            hintText: "Type your acha sa msg here :D"),
                ),
                        ],
                      ),
                    )),
                Icon(Icons.send)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
