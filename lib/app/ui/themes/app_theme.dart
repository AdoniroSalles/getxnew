//arquivo de tema para o aplicativo

import 'package:flutter/material.dart';

final ThemeData appThemeData = ThemeData(
    primarySwatch: Colors.green,
    brightness: Brightness.light,
    accentColor: Colors.cyan[600],
    appBarTheme: AppBarTheme(
      color: Colors.green,
    ));

final ThemeData appThemeDataDark = ThemeData(
  primaryColor: Colors.black,
  buttonColor: Colors.black,
  brightness: Brightness.dark,
  accentColor: Colors.cyan[600],
  appBarTheme: AppBarTheme(
    color: Colors.black,
  ),
);
