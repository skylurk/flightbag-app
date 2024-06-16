import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: const ColorScheme.light(
    surface: Color.fromARGB(255, 255, 255, 255),
    primary: Color.fromARGB(255, 210, 231, 248),
    secondary: Color.fromARGB(255, 0, 0, 0),
  ),
);

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: const ColorScheme.dark(
    surface: Color.fromARGB(255, 31, 30, 30),
    primary: Color.fromARGB(255, 77, 77, 77),
    secondary: Color.fromARGB(255, 255, 255, 255),
  ),
);