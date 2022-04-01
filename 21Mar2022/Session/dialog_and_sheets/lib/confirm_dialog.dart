import 'package:flutter/material.dart';

class ConfirmDialog extends StatelessWidget {
  const ConfirmDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      content: Container(
        color: Colors.red,
        child: ElevatedButton(
          onPressed: () => Navigator.pop(context, true),
          child: Text("Close Me"),
        ),
      ),
    );
  }
}
