import 'package:flutter/material.dart';

import 'form_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  List<FormData> items = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(
        title: const Text('Home page'),
      ),
      body: items.isNotEmpty
          ? ListView.builder(
              itemCount: items.length,
              itemBuilder: item,
            )
          : const Center(
              child: Text('No Items available!',
                  style: TextStyle(color: Colors.white)),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push<FormData>(
                  MaterialPageRoute(builder: (_) => const FormScreen()))
              .then((value) => setState(() {
                    items.add(value!);
                  }));
        },
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }

  Widget item(BuildContext context, int index) => Card(
        margin: const EdgeInsets.all(10),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(items[index].title),
                  Text(items[index].descp),
                ],
              )),
              GestureDetector(
                  child: const Icon(Icons.delete, color: Colors.red),
                  onTap: () {
                    setState(() {
                      items.removeAt(index);
                    });
                  })
            ],
          ),
        ),
      );
}
