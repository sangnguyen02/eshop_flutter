import 'package:eshop/utils/theme/custom_themes/text_theme.dart';
import 'package:flutter/material.dart';

class EshopTheme {
  EshopTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    textTheme: EshopTextTheme.lightTextTheme,

  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.black,
    textTheme: EshopTextTheme.darkTextTheme,

  );
}