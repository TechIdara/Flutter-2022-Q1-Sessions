import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({Key? key}) : super(key: key);

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  TextEditingController titleFieldController = TextEditingController();
  TextEditingController descpFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Job'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: titleFieldController,
              decoration: const InputDecoration(hintText: "Title"),
            ),
            TextField(
              controller: descpFieldController,
              decoration: const InputDecoration(hintText: "Descp"),
            ),
            const Spacer(),
            ElevatedButton(
                onPressed: () {
                  onSave(context);
                },
                child: const Text('Save'))
          ],
        ),
      ),
    );
  }

  void onSave(BuildContext context) {
    var data = FormData(titleFieldController.text, descpFieldController.text);
    Navigator.pop(context, data);
  }
}

class FormData {
  final String title;
  final String descp;

  FormData(this.title, this.descp);
}
