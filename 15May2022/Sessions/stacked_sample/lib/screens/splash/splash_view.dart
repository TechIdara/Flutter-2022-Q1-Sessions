import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_sample/screens/splash/splash_view_model.dart';

class SplashView extends ViewModelBuilderWidget<SplashViewModel> {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget builder(
      BuildContext context, SplashViewModel viewModel, Widget? child) {
    return const Scaffold(
        body: Center(
      child: Text("Splash Screen 📠", style: TextStyle(fontSize: 25)),
    ));
  }

  @override
  SplashViewModel viewModelBuilder(BuildContext context) =>
      SplashViewModel(context);

  @override
  bool get reactive => true;

  @override
  void onViewModelReady(SplashViewModel viewModel) => viewModel.init();
}
