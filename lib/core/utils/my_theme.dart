import 'package:flutter/material.dart';

class MyTheme {
  Brightness? brightness;
  MaterialColor? primarySwatch;
  Color? primaryColor;
  Color? primaryColorDark;
  Color? primaryColorLight;
  TextTheme? textTheme;
  ButtonThemeData? buttonThemeData;
  InputDecorationTheme? inputDecorationTheme;
  TabBarTheme? tabBarTheme;
  MyTheme(
      {this.brightness,
      this.primaryColorDark,
      this.primaryColorLight,
      this.primarySwatch,
      this.primaryColor,
      this.textTheme,
      this.buttonThemeData,
      this.inputDecorationTheme,
      this.tabBarTheme});
}