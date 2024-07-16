// ignore_for_file: unused_local_variable

import 'package:e_commerce/common/brands/brand_card.dart';
import 'package:e_commerce/common/widget/custom_shapes/container/rounded_container.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';

class BrandShowCase extends StatelessWidget {
  const BrandShowCase({
    super.key,
    required this.images,
  });

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunction.isDark(context);
    return RoundedContainer(
      showBorder: true,
      backgroundColor: Colors.transparent,
      borderColor: MyColors.grey,
      margin: const EdgeInsets.only(bottom: MySize.spaceBtwItems),
      padding: const EdgeInsets.all(MySize.md),
      child: Column(
        children: [
          const BrandCard(showBorder: false),
          Row(
            children: images
                .map((image) => brandTopProductsImageWidget(image, context))
                .toList(),
          )
        ],
      ),
    );
  }

  Expanded brandTopProductsImageWidget(String image, context) {
    final dark = HelperFunction.isDark(context);

    return Expanded(
      child: RoundedContainer(
        height: 100,
        backgroundColor: dark ? MyColors.darkerGrey : MyColors.light,
        margin: const EdgeInsets.only(right: MySize.sm),
        padding: const EdgeInsets.all(MySize.md),
        child: Image(
          fit: BoxFit.contain,
          image: AssetImage(image),
        ),
      ),
    );
  }
}
