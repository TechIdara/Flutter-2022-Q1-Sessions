import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:stacked/stacked.dart';

import 'home_view_model.dart';

class HomeView extends ViewModelBuilderWidget<HomeViewModel> {
  @override
  Widget builder(BuildContext context, HomeViewModel viewModel, Widget? child) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Home'),
        ),
        body: Center(
          child: Text("Home"),
        ));
  }

  @override
  HomeViewModel viewModelBuilder(BuildContext context) => HomeViewModel();
}
