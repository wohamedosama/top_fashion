import 'package:flutter/material.dart';

class CustomTextFromField extends StatelessWidget {
  const CustomTextFromField({
    super.key,
    this.onFieldSubmitted,
    this.isPassword = false,
    this.suffixIcon,
    this.suffixPressed,
    required this.prefixIcon,
    required this.textInputType,
    required this.controller,
    required this.labelText,
    this.isClickable = true,
    this.validator,
  });

  final void Function(String)? onFieldSubmitted;
  final IconData? suffixIcon;
  final bool isPassword;
  final void Function()? suffixPressed;
  final Icon prefixIcon;
  final TextInputType textInputType;
  final TextEditingController controller;
  final String labelText;
  final bool isClickable;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: textInputType,
      validator: validator,
      enabled: isClickable,
      onFieldSubmitted: onFieldSubmitted,
      decoration: InputDecoration(
        suffixIcon: suffixIcon != null
            ? IconButton(
                onPressed: suffixPressed,
                icon: Icon(suffixIcon),
              )
            : null,
        prefixIcon: prefixIcon,
        labelText: labelText,
      ),
      obscureText: isPassword,
      autofocus: true,
    );
  }
}
