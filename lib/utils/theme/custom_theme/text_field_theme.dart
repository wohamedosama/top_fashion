import '../../constants/sizes.dart';
import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class TextFormFieldAppTheme {
  TextFormFieldAppTheme._();

  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: MyColors.darkGrey,
    suffixIconColor: MyColors.darkGrey,
    // constraints: const BoxConstraints.expand(height: MySize.inputFieldHeight),
    labelStyle: const TextStyle()
        .copyWith(fontSize: MySize.fontSizeMd, color: MyColors.black),
    hintStyle: const TextStyle()
        .copyWith(fontSize: MySize.fontSizeSm, color: MyColors.black),
    errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
    floatingLabelStyle:
        const TextStyle().copyWith(color: MyColors.black.withOpacity(0.8)),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(MySize.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: MyColors.grey),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(MySize.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: MyColors.grey),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(MySize.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: MyColors.dark),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(MySize.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: MyColors.warning),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(MySize.inputFieldRadius),
      borderSide: const BorderSide(width: 2, color: MyColors.warning),
    ),
  );

  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 2,
    prefixIconColor: MyColors.darkGrey,
    suffixIconColor: MyColors.darkGrey,
    // constraints: const BoxConstraints.expand(height: MySize.inputFieldHeight),
    labelStyle: const TextStyle()
        .copyWith(fontSize: MySize.fontSizeMd, color: MyColors.white),
    hintStyle: const TextStyle()
        .copyWith(fontSize: MySize.fontSizeSm, color: MyColors.white),
    floatingLabelStyle:
        const TextStyle().copyWith(color: MyColors.white.withOpacity(0.8)),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(MySize.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: MyColors.darkGrey),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(MySize.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: MyColors.darkGrey),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(MySize.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: MyColors.white),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(MySize.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: MyColors.warning),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(MySize.inputFieldRadius),
      borderSide: const BorderSide(width: 2, color: MyColors.warning),
    ),
  );
}
