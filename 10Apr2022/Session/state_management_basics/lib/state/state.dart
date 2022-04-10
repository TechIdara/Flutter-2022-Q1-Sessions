import 'package:flutter/material.dart';
import 'package:state_management_basics/state/user.dart';

class AppStateWidget extends StatefulWidget {
  final Widget child;
  const AppStateWidget({Key? key, required this.child}) : super(key: key);

  @override
  State<AppStateWidget> createState() => AppStateWidgetState();
}

class AppStateWidgetState extends State<AppStateWidget> {
  User? user;

  updateUsername(User newUser) => setState(() {
        user = newUser;
      });

  @override
  Widget build(BuildContext context) {
    return MyInheritedWidget(child: widget.child, state: this);
  }
}

class MyInheritedWidget extends InheritedWidget {
  final AppStateWidgetState state;

  MyInheritedWidget({required Widget child, required this.state})
      : super(child: child);

  static AppStateWidgetState? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<MyInheritedWidget>()?.state;

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;
}
