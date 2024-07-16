import '../../../../../utils/constants/text_strings.dart';
import 'package:flutter/material.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({super.key, required this.onPressed});

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        child: const Text(MyTexts.createAccount),
      ),
    );
  }
}
