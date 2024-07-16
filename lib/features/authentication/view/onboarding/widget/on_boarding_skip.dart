import '../../../../../utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({
    super.key,
    required this.text,
    required this.onPressed,
  });

  final String text;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: MySize.appBarHeight,
        right: MySize.defaultSpace,
        child: TextButton(
          onPressed: onPressed,
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.5,
            ),
          ),
        ));
  }
}
