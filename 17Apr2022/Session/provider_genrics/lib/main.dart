import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_genrics/ApiResonse.dart';

void main() {
  runApp(const MyApp());
}

class MyAppState extends ChangeNotifier {
  AppUser? appUser;
  String? username;

  updateUsername(String? username) {
    this.username = username;
    notifyListeners();
  }

  updateUser(AppUser? newUser) {
    appUser = newUser;
    notifyListeners();
  }

  //
  // addToCart(Product p,int qty){
  //   p.qty = qty;
  //   products.add(p);
  //   notifyListeners();
  // }
  //
  static of(BuildContext context, {bool listen = true}) =>
      Provider.of<MyAppState>(context, listen: listen);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => MyAppState(),
      builder: (ctx, _) => MaterialApp(
        home: Home(),
      ),
    );
  }
}

// class ServiceCenter<C>{
//   C car;
//   ServiceCenter(this.car);
//
//   C getVehicle() => car;
// }

class Home extends StatelessWidget {
  AppUser? parseData() {
    String json = '''
    {
    "message": "Success",
    "statusCode": 200,
    "data": {
        "id": 1,
        "email": "ishaq@ishaqhassan.com",
        "phone": "123",
        "password": "123456",
        "accessToken": "c4ddb485-5dad-4b23-982e-b3926849776e"
    }
}
    ''';
    var decodedJSON = jsonDecode(json);
    AppUser u = AppUser.fromJson(decodedJSON['data']);

    var res1 = ApiResponse<AppUser>.fromJson(decodedJSON, u);
    return res1.data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Provider & Generics"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              MyAppState.of(context).username ?? "",
              style: Theme.of(context).textTheme.headline4,
            ),
            ElevatedButton(
                onPressed: () {
                  MyAppState.of(context, listen: false)
                      .updateUsername("Hello world");
                  //MyAppState.of(context, listen: false).up(parseData());
                },
                child: Text("Update App State"))
          ],
        ),
      ),
    );
  }
}
