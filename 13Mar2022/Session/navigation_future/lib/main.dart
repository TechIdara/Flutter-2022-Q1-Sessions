import 'package:flutter/material.dart';

void main() {
  //meraDairShnaiwalaKaam();
  runApp(const MyApp());
}

// meraDairShnaiwalaKaam() {
//   asyncTask();
//   print("Hello world");
// }
//
// asyncTask() async {
// /*
// // Catch block
// futureObj.catchError((e) {
//     print(e);
// })
//
// // Try Block
// .then((value) => print(value));
// */
//
//   var futureObj = Future.delayed(
//       Duration(seconds: 2), () => "Hello World From future after 2 sec");
//
//   try {
//     var responseFromFutureTask = await futureObj;
//     print(responseFromFutureTask);
//   } catch (e) {
//     print("Error $e");
//   }
// }

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: "/",
      onGenerateRoute: (RouteSettings settings) {
        Map<String, Widget> pages = {"/": Home(), "/about": About()};
        var pageToShow = pages[settings.name] ?? Home();
        if (settings.arguments != null) {
          if (settings.arguments is Map<String, String> &&
              settings.name == "/about") {
            pageToShow = About(
              title: (settings.arguments as Map<String, String>)['title']!,
            );
          }
        }
        return MaterialPageRoute<String>(
            builder: (childContext) => pageToShow, settings: settings);
      },
    );
  }
}

pageChangeKro(BuildContext context, Widget page) =>
    Navigator.push<String>(context, MaterialPageRoute(builder: (_) => page));

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String dataFromAbout = "";

  @override
  void initState() {
    super.initState();
    showMainpage();
  }

  showMainpage() async {
    await Future.delayed(Duration(seconds: 2));
    pageChangeKro(context, About());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(dataFromAbout),
            ElevatedButton(
                onPressed: () async {
                  // Navigator.pushNamed<String>(context, "/about", arguments: {
                  //   "title": "About ka title home sai",
                  // }).then((value) => setState(() {
                  //       dataFromAbout = value ?? "";
                  //     }));
                  var responseFromAbout = await Navigator.push<String>(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const About(
                                title: "Home s data agya :D",
                              )));
                  print("hello world");
                  setState(() {
                    dataFromAbout = responseFromAbout ?? "";
                  });
                },
                child: Text("Hello world", style: TextStyle(fontSize: 35))),
          ],
        ),
      ),
    );
  }
}

class About extends StatelessWidget {
  final String title;

  const About({Key? key, this.title = "About"}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(title),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              Navigator.pop<String>(context, "Han bhai hgya :D");
            },
            child: Text("About Hello world", style: TextStyle(fontSize: 35))),
      ),
    );
  }
}
