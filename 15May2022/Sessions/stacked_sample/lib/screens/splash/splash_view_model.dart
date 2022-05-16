import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_sample/screens/home/home_view.dart';

class SplashViewModel extends BaseViewModel {
  final BuildContext context;
  SplashViewModel(this.context);

  init() async {
    await Future.delayed(Duration(milliseconds: 2000));
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => HomeView()));
  }
}
