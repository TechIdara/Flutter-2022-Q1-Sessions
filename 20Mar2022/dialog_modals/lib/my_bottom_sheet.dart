import 'package:flutter/material.dart';

class MyBottomSheet extends StatelessWidget {
  const MyBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      builder: (_) => Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.red,
        child: ElevatedButton(
            child: Text("Hello world"),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      onClosing: () {
        print("Hello world closing");
      },
    );
  }
}
