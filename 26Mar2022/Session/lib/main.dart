import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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

/*
* ListView.builder(
        itemCount: 10,
        itemBuilder: (childCtx, index) => Text("Hello $index"),
      ),
    );
* */

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final String url = "https://api.github.com/users/ishaquehassan";
  String? nameFromAPI;
  bool isLoading = false;

  callApi() async {
    setState(() {
      isLoading = true;
    });
    try {
      var response = await http.get(Uri.parse(url));
      var responseString = response.body;
      Map<String, dynamic> parsedJson = jsonDecode(responseString);
      setState(() {
        nameFromAPI = parsedJson['name'];
      });
    } catch (e) {
      print(e);
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("API Sample"),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (nameFromAPI != null) Text(nameFromAPI!),
            if (isLoading) CircularProgressIndicator(),
            ElevatedButton(
              child: Text("Click to call API"),
              onPressed: () {
                callApi();
              },
            )
          ],
        )));
  }
}
