import 'package:stacked/stacked.dart';

class CounterService with ReactiveServiceMixin {
  ReactiveValue<int> _counter = ReactiveValue(0);

  CounterService() {
    listenToReactiveValues([_counter]);
  }

  int get counter => _counter.value;
  set counter(int value) {
    _counter.value = value;
  }

  void increament() {
    counter++;
  }
}
