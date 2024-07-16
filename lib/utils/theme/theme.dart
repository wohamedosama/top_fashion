import 'custom_theme/app_barapp_theme.dart';
import 'custom_theme/bottom_sheet_app_theme.dart';
import 'custom_theme/checkbox_theme.dart';
import 'custom_theme/elevated_button_theme.dart';
import 'custom_theme/outlined_button_theme.dart';
import 'custom_theme/text_field_theme.dart';
import 'custom_theme/text_theme.dart';
import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Pippins',
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    textTheme: AppTextTheme.lightTextTheme,
    elevatedButtonTheme: ElevatedButtonAppTheme.lightElevatedButtonThemeData,
    appBarTheme: AppBarAppTheme.lightAppBarAppTheme,
    bottomSheetTheme: BottomSheetAppTheme.lightBottomSheetAppTheme,
    checkboxTheme: CheckBoxAppTheme.lightCheckBoxTheme,
    outlinedButtonTheme: OutlinedButtonAppTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: TextFormFieldAppTheme.lightInputDecorationTheme,
  );
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Pippins',
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.black,
    textTheme: AppTextTheme.darkTextTheme,
    elevatedButtonTheme: ElevatedButtonAppTheme.darkElevatedButtonThemeData,
    appBarTheme: AppBarAppTheme.darkAppBarAppTheme,
    bottomSheetTheme: BottomSheetAppTheme.darkBottomSheetAppTheme,
    checkboxTheme: CheckBoxAppTheme.darkCheckBoxTheme,
    outlinedButtonTheme: OutlinedButtonAppTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: TextFormFieldAppTheme.darkInputDecorationTheme,
  );
}
