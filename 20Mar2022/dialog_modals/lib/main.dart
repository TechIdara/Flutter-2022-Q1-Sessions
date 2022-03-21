import 'package:dialog_modals/my_bottom_sheet.dart';
import 'package:flutter/material.dart';

import 'confirm_dialog.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (dialogContext) => ConfirmDialog(
                          title: "Are you sure?",
                          onPress: () {
                            Navigator.pop(context);
                          },
                        ));
              },
              child: Text("Click to open Dialog"),
            ),
            Builder(
                builder: (childContext) => ElevatedButton(
                    onPressed: () {
                      showModalBottomSheet(
                          context: childContext,
                          builder: (bottomSheetContext) => MyBottomSheet());
                    },
                    child: Text("Bottom Sheet")))
          ],
        ),
      ),
    );
  }
}
