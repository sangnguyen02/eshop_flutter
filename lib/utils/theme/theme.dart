import 'package:eshop/utils/theme/custom_themes/appbar_theme.dart';
import 'package:eshop/utils/theme/custom_themes/bottom_sheet_theme.dart';
import 'package:eshop/utils/theme/custom_themes/checkbox_theme.dart';
import 'package:eshop/utils/theme/custom_themes/chip_theme.dart';
import 'package:eshop/utils/theme/custom_themes/elevated_button_theme.dart';
import 'package:eshop/utils/theme/custom_themes/outlined_button_theme.dart';
import 'package:eshop/utils/theme/custom_themes/text_field_theme.dart';
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

    appBarTheme: EshopAppBarTheme.lightAppBarTheme,
    bottomSheetTheme: EshopBottomSheetTheme.lightBottomSheetTheme,

    textTheme: EshopTextTheme.lightTextTheme,
    inputDecorationTheme: EshopTextFormFieldTheme.lightInputDecorationTheme,

    checkboxTheme: EshopCheckboxTheme.lightCheckboxTheme,
    chipTheme: EshopChipTheme.lightChipTheme,

    elevatedButtonTheme: EshopElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: EshopOutlinedButtonTheme.lightOutlinedButtonTheme


  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.black,

    appBarTheme: EshopAppBarTheme.lightAppBarTheme,
    bottomSheetTheme: EshopBottomSheetTheme.darkBottomSheetTheme,

    textTheme: EshopTextTheme.darkTextTheme,
    inputDecorationTheme: EshopTextFormFieldTheme.darkInputDecorationTheme,

    checkboxTheme: EshopCheckboxTheme.darkCheckboxTheme,
    chipTheme: EshopChipTheme.darkChipTheme,

    elevatedButtonTheme: EshopElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: EshopOutlinedButtonTheme.darkOutlinedButtonTheme
  );
}