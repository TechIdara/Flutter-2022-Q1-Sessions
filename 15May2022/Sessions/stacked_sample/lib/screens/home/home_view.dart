import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_sample/screens/Home/home_view_model.dart';

class HomeView extends ViewModelBuilderWidget<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(BuildContext context, HomeViewModel viewModel, Widget? child) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: viewModel.increament,
        ),
        body: Center(
          child: Text("Counter : ${viewModel.counter}",
              style: const TextStyle(fontSize: 25)),
        ));
  }

  @override
  HomeViewModel viewModelBuilder(BuildContext context) =>
      HomeViewModel(context);

  @override
  bool get reactive => true;
}
