import '../../constants/colors.dart';
import '../../constants/sizes.dart';
import 'package:flutter/material.dart';

class CheckBoxAppTheme {
  CheckBoxAppTheme._();

  static CheckboxThemeData lightCheckBoxTheme = CheckboxThemeData(
    shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(MySize.xs)),
    checkColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.selected)) {
        return MyColors.white;
      } else {
        return MyColors.black;
      }
    }),
    fillColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.selected)) {
        return MyColors.primary;
      } else {
        return Colors.transparent;
      }
    }),
  );
  static CheckboxThemeData darkCheckBoxTheme = CheckboxThemeData(
    shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(MySize.xs)),
    checkColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.selected)) {
        return MyColors.white;
      } else {
        return MyColors.black;
      }
    }),
    fillColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.selected)) {
        return MyColors.primary;
      } else {
        return Colors.transparent;
      }
    }),
  );
}

//
//   /// Customizable Dark Text Theme
//   static CheckboxThemeData darkCheckboxTheme = CheckboxThemeData(
