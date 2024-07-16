import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_function.dart';

class CircularButton extends StatelessWidget {
  const CircularButton({super.key, required this.onPressed});

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunction.isDark(context);
    return Positioned(
      right: MySize.defaultSpace,
      bottom: 85,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          backgroundColor: dark ? MyColors.primary : Colors.black,
          elevation: 0,
          disabledBackgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        onPressed: onPressed,
        child: const Icon(
          Iconsax.arrow_right_3,
        ),
      ),
    );
  }
}
