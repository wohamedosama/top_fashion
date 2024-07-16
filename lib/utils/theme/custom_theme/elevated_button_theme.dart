import '../../constants/colors.dart';
import '../../constants/sizes.dart';
import 'package:flutter/material.dart';

class ElevatedButtonAppTheme {
  ElevatedButtonAppTheme._();

  static ElevatedButtonThemeData lightElevatedButtonThemeData =
      ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
        elevation: 0,
        foregroundColor: MyColors.light,
        backgroundColor: MyColors.primary,
        disabledForegroundColor: MyColors.darkGrey,
        disabledBackgroundColor: MyColors.buttonDisabled,
        side: const BorderSide(color: MyColors.primary),
        padding: const EdgeInsets.symmetric(vertical: MySize.buttonHeight),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(MySize.buttonRadius)),
        textStyle: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
            color: MyColors.textWhite)),
  );
  static ElevatedButtonThemeData darkElevatedButtonThemeData =
      ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
        elevation: 0,
        foregroundColor: MyColors.light,
        backgroundColor: MyColors.primary,
        disabledForegroundColor: MyColors.darkGrey,
        disabledBackgroundColor: MyColors.darkGrey,
        side: const BorderSide(color: MyColors.primary),
        padding: const EdgeInsets.symmetric(vertical: MySize.buttonHeight),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(MySize.buttonRadius)),
        textStyle: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
            color: MyColors.textWhite)),
  );
}
