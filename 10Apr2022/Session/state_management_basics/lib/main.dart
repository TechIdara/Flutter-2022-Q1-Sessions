import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:state_management_basics/state/state.dart';
import 'package:state_management_basics/state/user.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return AppStateWidget(
      child: MaterialApp(
        home: Home(),
      ),
    );
  }
}

class Home extends StatelessWidget {
  TextEditingController usernameCtrl = TextEditingController();

  pickImage(BuildContext context) async {
    final ImagePicker _picker = ImagePicker();
    XFile? pickedImage = await _picker.pickImage(source: ImageSource.gallery);
    var myAppState = MyInheritedWidget.of(context);
    myAppState?.updateUsername(
        User(name: usernameCtrl.text, image: File(pickedImage?.path ?? "")));
  }

  @override
  Widget build(BuildContext context) {
    var myAppState = MyInheritedWidget.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Home page ${myAppState?.user?.name}"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: usernameCtrl,
              decoration:
                  InputDecoration(hintText: "Please enter your username"),
            ),
            ElevatedButton(
                onPressed: () {
                  pickImage(context);
                },
                child: Text("Update Username")),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => ProfileScreen()));
                },
                child: Text("Goto Profile")),
            if (myAppState?.user != null)
              Image.file(myAppState!.user!.image, height: 100)
          ],
        ),
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    controller.text = MyInheritedWidget.of(context)!.user!.name;
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: Card(
        child: Column(
          children: [
            Row(
              children: [
                ClipRRect(
                  child: Image.file(MyInheritedWidget.of(context)!.user!.image,
                      width: 100, height: 100, fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(50),
                ),
                Expanded(
                  child: TextField(
                      controller: controller,
                      style: Theme.of(context).textTheme.headline4),
                ),
              ],
            ),
            ElevatedButton(
                onPressed: () {
                  User newUser = User(
                      name: controller.text,
                      image: MyInheritedWidget.of(context)!.user!.image);
                  MyInheritedWidget.of(context)?.updateUsername(newUser);
                },
                child: Text("Update State"))
          ],
        ),
      ),
    );
  }
}
