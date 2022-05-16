import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_sample/services/counter_service.dart';

class HomeViewModel extends ReactiveViewModel {
  final CounterService _counterService = CounterService();

  CounterService get service => _counterService;

  increament() => service.increament();

  int get counter => service.counter;

  final BuildContext context;
  HomeViewModel(this.context);

  @override
  List<ReactiveServiceMixin> get reactiveServices => [_counterService];
}
