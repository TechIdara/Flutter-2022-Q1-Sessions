import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:local_storage_provider/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  TextEditingController nameController = TextEditingController();
  final String dataKey = "USER_DATA";
  @override
  void initState() {
    loadFromLocal();
    super.initState();
  }

  loadFromLocal() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey(dataKey)) {
      String dataFromPref = prefs.getString(dataKey) ?? "";
      Map<String,dynamic> json = jsonDecode(dataFromPref);
      AppUser user =
          AppUser.fromJson(json);
      nameController.text = user.accessToken ?? "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pref Demo"),
      ),
      body: Form(
        child: Column(
          children: [
            TextFormField(
              controller: nameController,
              validator: (value) =>
                  (value?.isEmpty ?? true) ? "Please enter your name :D" : null,
            ),
            Builder(builder: (context) {
              return ElevatedButton(
                  onPressed: () => saveDataLocally(context),
                  child: Text("Save"));
            })
          ],
        ),
      ),
    );
  }

  void saveDataLocally(BuildContext context) async {
    if (Form.of(context)!.validate()) {
      String jsonResponse = '''{
          "message": "Success",
    "statusCode": 200,
    "data": {
    "id": 3,
    "email": "hello1@world.com",
    "phone": "123",
    "password": "123456",
    "accessToken": "f2307b9b-e401-4014-b2c7-68e05e2ca17c"
    }
    }''';

      var response = ApiResponse.fromJson(jsonDecode(jsonResponse));

      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(dataKey, jsonEncode(response.data?.toJson()));
    }
  }
}
