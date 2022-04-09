import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:future_and_form/github_user.dart';
import 'package:http/http.dart' as http;

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
        primarySwatch: Colors.blue,
      ),
      home: FormDemo(),
    );
  }
}

class FormDemo extends StatelessWidget {
  TextEditingController usernameCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();

  FormDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Form Demo"),
      ),
      body: Form(
        child: Builder(builder: (childContext) {
          return Column(
            children: [
              TextFormField(
                controller: usernameCtrl,
                validator: (currentValue) {
                  var nonNullValue = currentValue ?? "";
                  if (nonNullValue.isEmpty || !nonNullValue.contains("@")) {
                    return "Please enter a valid Username Beta!";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: passwordCtrl,
              ),
              ElevatedButton(
                  onPressed: () {
                    if (Form.of(childContext)?.validate() ?? false) {
                      print("Hello world form passed!");
                    }
                  },
                  child: Text("Login"))
            ],
          );
        }),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  Future<GithubUser> getData() async {
    var response =
        await http.get(Uri.parse("https://api.github.com/users/ishaquehassan"));
    return GithubUser.fromJson(jsonDecode(response.body));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Future Builder"),
      ),
      body: FutureBuilder<GithubUser>(
        future: getData(),
        builder: (childContent, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return const Text("Bhai msla hgya h :D");
          } else {
            return Image.network(snapshot.data?.avatarUrl ?? "");
          }
        },
      ),
    );
  }
}
