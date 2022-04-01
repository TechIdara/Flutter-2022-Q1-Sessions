import 'package:flutter/material.dart';

class ConfirmModal extends StatelessWidget {
  const ConfirmModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        ListTile(
          onTap: () {
            Navigator.pop(context, true);
          },
          leading: Icon(Icons.check),
          title: Text("Agree"),
        ),
        ListTile(
          onTap: () {
            Navigator.pop(context, false);
          },
          leading: Icon(Icons.close),
          title: Text("Cancel"),
        )
      ],
    );
  }
}
