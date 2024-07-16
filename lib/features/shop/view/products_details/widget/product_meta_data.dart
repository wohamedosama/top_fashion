import '../../../../../common/widget/custom_shapes/container/rounded_container.dart';
import '../../../../../common/widget/image/circular_image.dart';
import '../../../../../common/widget/texts/brand_title_with_verification.dart';
import '../../../../../common/widget/texts/product-title_text.dart';
import '../../../../../common/widget/texts/product_price.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/enums.dart';
import '../../../../../utils/constants/images_string.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';

class ProductMetaData extends StatelessWidget {
  const ProductMetaData({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunction.isDark(context);

    return Padding(
      padding: const EdgeInsets.only(
          left: MySize.defaultSpace,
          right: MySize.defaultSpace,
          bottom: MySize.defaultSpace),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              RoundedContainer(
                radius: MySize.sm,
                backgroundColor: MyColors.secondary.withOpacity(0.8),
                padding: const EdgeInsets.symmetric(
                    horizontal: MySize.sm, vertical: MySize.xs),
                child: Text(
                  '25%',
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .apply(color: MyColors.black),
                ),
              ),
              const SizedBox(width: MySize.spaceBtwItems),
              Text(
                '250 EGP',
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .apply(decoration: TextDecoration.lineThrough),
              ),
              const SizedBox(width: MySize.spaceBtwItems),
               ProductPrice(price: 175, isLarge: true),
            ],
          ),
          const SizedBox(height: MySize.spaceBtwItems / 1.5),
          const ProductTitleText(text: 'Green Nike Air Shoe'),
          const SizedBox(height: MySize.spaceBtwItems / 1.5),
          Row(
            children: [
              const ProductTitleText(text: 'Nike'),
              const SizedBox(width: MySize.spaceBtwItems),
              Text('In Stock', style: Theme.of(context).textTheme.titleMedium)
            ],
          ),
          const SizedBox(height: MySize.spaceBtwItems / 1.5),
          Row(
            children: [
              CircularImage(
                overlayColor: dark ? MyColors.white : MyColors.black,
                image: MyImages.shoeIcon,
                width: 32,
                height: 32,
              ),
              const BrandTitleWithVerification(
                  title: 'Nike', brandTextSize: TextSizes.medium),
            ],
          )
        ],
      ),
    );
  }
}
