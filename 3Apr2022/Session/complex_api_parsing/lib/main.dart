import 'dart:convert';

import 'package:complex_api_parsing/models/book.dart';
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
  TextEditingController textEditingController = TextEditingController();
  String get searchKeyword => textEditingController.text;

  _getBooks() async {
    setState(() {
      isLoading = true;
    });
    try {
      var url = Uri.parse(
          'https://www.googleapis.com/books/v1/volumes?q=$searchKeyword');
      var response = await http.get(url);
      var responseSTR = response.body;
      var decodedJson = jsonDecode(responseSTR);
      setState(() {
        this.response = BookResponse.fromJson(decodedJson);
      });
    } catch (e) {
      print(e);
      setState(() {
        this.response = null;
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  void onSearchButtonPress() => _getBooks();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("API CALLS COMPLEX 🙄"),
        ),
        body: Column(
          children: [
            Row(
              children: [
                Expanded(
                    child: TextField(
                  controller: textEditingController,
                )),
                ElevatedButton(
                    onPressed: onSearchButtonPress, child: Text("Search"))
              ],
            ),
            if (!isLoading)
              Expanded(
                child: ListView.builder(
                  itemCount: response?.items?.length ?? 0,
                  itemBuilder: (_, index) => ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => BookDetail(
                                  bookFromList: (response?.items![index])!)));
                    },
                    title:
                        Text(response?.items![index].volumeInfo?.title ?? ""),
                    subtitle: Text(
                        response?.items![index].volumeInfo?.authors?.first ??
                            ""),
                    leading: Image.network(response
                            ?.items![index].volumeInfo?.imageLinks?.thumbnail ??
                        ""),
                  ),
                ),
              ),
            if (isLoading)
              Center(
                child: CircularProgressIndicator(),
              )
          ],
        ));
  }
}

class BookDetail extends StatefulWidget {
  final Book bookFromList;

  BookDetail({required this.bookFromList});

  @override
  State<BookDetail> createState() => _BookDetailState();
}

class _BookDetailState extends State<BookDetail> {
  late Book book;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    book = widget.bookFromList;
    _getBookDetail();
  }

  _getBookDetail() async {
    setState(() {
      isLoading = true;
    });
    try {
      var uri =
          Uri.parse("https://www.googleapis.com/books/v1/volumes/${book.id}");
      var response = await http.get(uri);
      var jsonDecoded = jsonDecode(response.body);
      setState(() {
        book = Book.fromJson(jsonDecoded);
      });
    } catch (e) {
      setState(() {
        book = widget.bookFromList;
      });
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Book Detail"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(book.volumeInfo?.title ?? ""),
            Image.network(book.volumeInfo?.imageLinks?.extraLarge ??
                book.volumeInfo?.imageLinks?.thumbnail ??
                ""),
            if (isLoading) CircularProgressIndicator()
          ],
        ),
      ),
    );
  }
}
