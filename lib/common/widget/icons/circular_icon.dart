import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';

class CircularIcon extends StatelessWidget {
  const CircularIcon({
    super.key,
    required this.icon,
    this.color,
    this.width,
    this.height,
    this.size = MySize.lg,
    this.backgroundColor,
    this.onPressed,
  });

  final IconData icon;
  final Color? color;
  final double? width, height, size;
  final Color? backgroundColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunction.isDark(context);

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor != null
            ? backgroundColor!
            : dark
                ? MyColors.black.withOpacity(0.9)
                : MyColors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(100),
      ),
      child: IconButton(
          onPressed: onPressed,
          icon: Icon(
            icon,
            size: size,
            color: color,
          )),
    );
  }
}
