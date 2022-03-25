import 'package:flutter/material.dart';

abstract class AppTheme {
  static ThemeData get light => ThemeData(
      primarySwatch: Colors.deepOrange,
      textTheme: TextTheme(
          headline1: TextStyle(
              fontSize: 30, color: Colors.black, fontWeight: FontWeight.bold)));

  static ThemeData get lightv2 => light.copyWith(
      textTheme: light.textTheme.copyWith(
          headline1: light.textTheme.headline1!.copyWith(color: Colors.red)));

  static ThemeData get dark => ThemeData.dark().copyWith(
      textTheme: lightv2.textTheme.copyWith(),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.red))));
}
