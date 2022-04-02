import 'dart:convert';

import 'package:complex_api_parsing/models/book_response.dart';
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

// response["items"][0]["volumeInfo"]["title"]
//response["items"][0]["volumeinfo"]["authors"][0]

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  BookResponse? response;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _getBooks();
  }

  _getBooks() async {
    setState(() {
      isLoading = true;
    });
    try {
      var url =
          Uri.parse('https://www.googleapis.com/books/v1/volumes?q=flutter');
      var response = await http.get(url);
      var responseSTR = response.body;
      var decodedJson = jsonDecode(responseSTR) as Map<String, dynamic>;
      setState(() {
        this.response = BookResponse.fromJson(decodedJson);
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
          title: Text("API CALLS COMPLEX 🙄"),
        ),
        body: ListView.builder(
          itemCount: response?.items?.length ?? 0,
          itemBuilder: (_, index) => ListTile(
            title: Text(response?.items![index].volumeInfo?.title ?? ""),
            subtitle:
                Text(response?.items![index].volumeInfo?.authors?.first ?? ""),
            leading: Image.network(
                response?.items![index].volumeInfo?.imageLinks?.thumbnail ??
                    ""),
          ),
        ));
  }
}
