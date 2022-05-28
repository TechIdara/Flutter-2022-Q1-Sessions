import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_explained/views/splash/splash_view_model.dart';

class SplashView extends ViewModelBuilderWidget<SplashViewModel> {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget builder(
      BuildContext context, SplashViewModel viewModel, Widget? child) {
    return Scaffold(
        body: Center(
      child:
          Text("Splash Screen", style: Theme.of(context).textTheme.headline3),
    ));
  }

  @override
  SplashViewModel viewModelBuilder(BuildContext context) =>
      SplashViewModel(context);

  @override
  void onViewModelReady(SplashViewModel viewModel) {
    viewModel.init();
  }

  @override
  bool get reactive => true;
}
