import 'package:flutter/material.dart';
import 'package:my_first_flutter_app/screens/signup.dart';

void main() {
  runApp(MyApp());
}

// MaterialApp main features
// Theme
// navigator
// localization

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SignUp(),
      debugShowCheckedModeBanner: false,
    );
  }
}
