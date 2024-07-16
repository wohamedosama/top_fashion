import 'package:flutter/material.dart';

abstract class SnackBarMessage {
  static void showSnackBar(SnackBarTypes snackBarTypes, String message, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      behavior: SnackBarBehavior.floating,
      content: Text(message,style:const TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
      backgroundColor: snackBarTypes == SnackBarTypes.SUCCESS ? Colors.green : Colors.redAccent,
      duration: Durations.medium4,
    ));
  }
}

enum SnackBarTypes {
  // ignore: constant_identifier_names
  SUCCESS,
  // ignore: constant_identifier_names
  ERORR;
}
