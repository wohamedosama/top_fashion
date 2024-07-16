import 'package:flutter/material.dart';

class HelperFunction {
  HelperFunction._();

  static bool isDark(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  static bool isLight(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light;
  }

  static double screenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double screenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }
}
