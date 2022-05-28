import 'package:di/api_service.dart';
import 'package:di/github_user.dart';
import 'package:flutter/material.dart';

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
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  GithubUser? githubUser;
  bool isLoading = false;

  @override
  void initState() {
    getGithubUser();
    super.initState();
  }

  //FirebaseAuth.instance
  getGithubUser() async {
    setState(() {
      isLoading = true;
    });
    var githubUser = await (ApiService.instance.getGithubUser("ishaquehassan"));
    setState(() {
      this.githubUser = githubUser;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Center(
        child: isLoading
            ? CircularProgressIndicator()
            : Text(githubUser?.name ?? "", style: TextStyle(fontSize: 30)),
      ),
    );
  }
}
