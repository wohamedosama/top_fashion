import '../../constants/colors.dart';
import '../../constants/sizes.dart';
import 'package:flutter/material.dart';

class AppBarAppTheme {
  AppBarAppTheme._();

  static AppBarTheme lightAppBarAppTheme = const AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData(color: MyColors.black, size: MySize.iconMd),
    actionsIconTheme: IconThemeData(color: MyColors.black, size: MySize.iconMd),
    titleTextStyle: TextStyle(
        fontSize: 18.0, fontWeight: FontWeight.w600, color: MyColors.black),
  );

  static AppBarTheme darkAppBarAppTheme = const AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData(color: MyColors.black, size: MySize.iconMd),
    actionsIconTheme: IconThemeData(color: MyColors.white, size: MySize.iconMd),
    titleTextStyle: TextStyle(
        fontSize: 18.0, fontWeight: FontWeight.w600, color: MyColors.white),
  );
}
