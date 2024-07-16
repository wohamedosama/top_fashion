import '../../../../../common/widget/texts/brand_title_text.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/enums.dart';
import '../../../../../utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class BrandTitleWithVerification extends StatelessWidget {
  const BrandTitleWithVerification({
    super.key,
    required this.title,
    this.maxLine = 1,
    this.textColor,
    this.iconColor = MyColors.primary,
    this.textAlign = TextAlign.center,
    this.brandTextSize = TextSizes.small,
  });

  final String title;
  final int maxLine;
  final Color? textColor, iconColor;
  final TextAlign? textAlign;
  final TextSizes brandTextSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: BrandTitleText(
              title: title,
              color: textColor,
              maxLines: maxLine,
              textAlign: textAlign,
              brandTextSize: brandTextSize),
        ),
        const SizedBox(width: MySize.xs),
        Icon(
          Iconsax.verify5,
          size: MySize.iconXs,
          color: iconColor,
        )
      ],
    );
  }
}
