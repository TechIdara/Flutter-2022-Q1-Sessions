import 'package:flutter/material.dart';
import 'package:image_assets/generated/my_images.asset.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
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
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
            decoration: BoxDecoration(
              color: Colors.red,
            ),
            width: 300,
            height: 300,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(150),
                child: Image.asset(MyImages.trophy1, fit: BoxFit.fitHeight))),
      ),
    );
  }
}
