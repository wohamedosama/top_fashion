import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_function.dart';

class SearchContainer extends StatelessWidget {
  const SearchContainer({
    super.key,
    required this.text,
    this.icon = Iconsax.search_normal,
    this.showBackGround = true,
    this.showBorder = true,
    this.onTap,
    this.padding = const EdgeInsets.symmetric(horizontal: MySize.defaultSpace),
  });

  final String text;
  final IconData? icon;
  final bool showBackGround, showBorder;
  final VoidCallback? onTap;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunction.isDark(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: padding,
        child: Container(
          width: HelperFunction.screenWidth(context),
          padding: const EdgeInsets.all(MySize.md),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(MySize.cardRadiusLg),
            color: showBackGround
                ? dark
                    ? MyColors.dark
                    : MyColors.white
                : Colors.transparent,
            border: showBorder ? Border.all(color: MyColors.grey) : null,
          ),
          child: Row(
            children: [
              Icon(icon, color: MyColors.darkGrey),
              const SizedBox(width: MySize.spaceBtwItems),
              Text(text, style: Theme.of(context).textTheme.bodySmall)
            ],
          ),
        ),
      ),
    );
  }
}
