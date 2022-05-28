import 'package:flutter/material.dart';

class MyForm {
  final List<TextFormField> fields;

  MyForm(this.fields);

  bool validate() {
    bool isOk = true;
    for (var field in fields) {
      if (field.validator!(field.controller?.text) != null) {
        isOk = false;
        break;
      }
    }
    return isOk;
  }
}
