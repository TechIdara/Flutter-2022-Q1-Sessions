import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rest_api/todo.dart';

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

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Todo> todos = [];
  bool isLoading = false;
  final url = 'https://6087dddba6f4a30017425143.mockapi.io/api/todos';

  @override
  void initState() {
    super.initState();
    getTodos();
  }

  getTodos() async {
    setState(() {
      isLoading = true;
    });
    try {
      var response = await http.get(Uri.parse(url + "/12"));
      setState(() {
        todos = Todo.fromJsonList(jsonDecode(response.body) as List<dynamic>);
      });
    } catch (e) {
      print(e);
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: !isLoading
          ? ListView.builder(
              itemCount: todos.length,
              itemBuilder: (childContext, itemIndex) => ListTile(
                title: Text(todos[itemIndex].title ?? ""),
                subtitle: Text(todos[itemIndex].description ?? ""),
              ),
            )
          : Center(child: CircularProgressIndicator()),
    );
  }
}
