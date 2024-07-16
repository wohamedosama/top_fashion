import '../../constants/colors.dart';
import '../../constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ShowFlutterToast {
  static void showToast({
    required String message,
    required ToastState state,
  }) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: choseToastColor(
        state: state,
      ),
      textColor: MyColors.white,
      fontSize: MySize.spaceBtwItems,
    );
  }
}

enum ToastState {
  success,
  error,
  warning,
}

Color choseToastColor({ToastState? state}) {
  Color? color;
  switch (state!) {
    case ToastState.success:
      color = Colors.green;
      break;
    case ToastState.warning:
      color = Colors.yellow;
      break;
    case ToastState.error:
      color = Colors.red;
      break;
  }
  return color;
}
