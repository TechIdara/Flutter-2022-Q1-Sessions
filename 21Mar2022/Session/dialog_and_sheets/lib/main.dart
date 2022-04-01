import 'package:dialog_and_sheets/confirm_dialog.dart';
import 'package:dialog_and_sheets/confirm_modal.dart';
import 'package:flutter/material.dart';

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
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}

// Dialog
// Modal Bottom Sheet

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Color bgColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: Text("Dialog & Sheets"),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () => showMyDialog(context), child: Text("Hello world")),
      ),
    );
  }

  showMyDialog(BuildContext context) async {
    /*builder: (_) => AlertDialog(
                title: Text("Hello world"),
                content: Text(
                    "My dialog text My dialog text My dialog text My dialog text My dialog text My dialog text"),
                actions: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context, false);
                      },
                      child: Text("Cancel")),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context, true);
                      },
                      child: Text("OK")),
                ])*/

    var isConfirmed = await showDialog<bool>(
        barrierDismissible: false,
        context: context,
        builder: (_) => ConfirmDialog());
    if (isConfirmed ?? false) {
      print("User confirmed the dialog");
    }
  }

  showModal(BuildContext context) async {
    var isConfirmed = await showModalBottomSheet<bool>(
        isDismissible: false, context: context, builder: (_) => ConfirmModal());

    if (isConfirmed ?? false) {
      setState(() {
        bgColor = Colors.green;
      });
    } else {
      setState(() {
        bgColor = Colors.red;
      });
    }
  }
}
