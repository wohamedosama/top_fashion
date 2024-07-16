// ignore_for_file: must_be_immutable

import '../../../styles/shadow.dart';
import '../../custom_shapes/container/rounded_container.dart';
import '../../icons/circular_icon.dart';
import '../../image/round_image.dart';
import '../../texts/product-title_text.dart';
import '../../texts/product_price.dart';
import '../../../../features/shop/view/products_details/product_details.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/images_string.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ProductCardVerticalCategorySceen extends StatelessWidget {
  const ProductCardVerticalCategorySceen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunction.isDark(context);
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ProductsDetails(),
          )),
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        height: 220,
        decoration: BoxDecoration(
          boxShadow: [ShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(MySize.productImageRadius),
          color: dark ? MyColors.darkerGrey : MyColors.white,
        ),
        child: Column(
          children: [
            //Thumbnails, wishlist Button,Discount tag,
            RoundedContainer(
              backgroundColor: dark ? MyColors.dark : MyColors.white,
              height: 180,
              padding: const EdgeInsets.all(MySize.sm),
              child: Stack(
                children: [
                  //Product Image
                  RoundedImage(
                    backgroundColor: dark ? MyColors.dark : MyColors.white,
                    imageUrl: MyImages.productImage1,
                    applyImageRadius: true,
                  ),
                  //Sale Tag
                  Positioned(
                    top: 10,
                    child: RoundedContainer(
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
                  ),
                  //Favorite Icon Button
                  const Positioned(
                    top: 0,
                    right: 0,
                    child: CircularIcon(
                      backgroundColor: Colors.transparent,
                      icon: Iconsax.heart5,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: MySize.spaceBtwItems / 2),

            //details
            Padding(
              padding: const EdgeInsets.all(MySize.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ProductTitleText(
                      text: 'Green Nike Air Shoe', smallSie: true),
                  const SizedBox(height: MySize.xs),
                  Row(
                    children: [
                      Text('Nike',
                          style: Theme.of(context).textTheme.labelMedium,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1),
                      const SizedBox(width: MySize.xs),
                      const Icon(
                        Iconsax.verify5,
                        size: MySize.iconXs,
                        color: MyColors.primary,
                      )
                    ],
                  ),
                ],
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //Price
                 Padding(
                    padding: EdgeInsets.only(left: MySize.sm),
                    child: ProductPrice(price: 35.0)),
                Container(
                  decoration: const BoxDecoration(
                    color: MyColors.dark,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(MySize.cardRadiusMd),
                      bottomRight: Radius.circular(MySize.productImageRadius),
                    ),
                  ),
                  child: const SizedBox(
                    height: MySize.iconLg * 1.2,
                    width: MySize.iconLg * 1.2,
                    child: Center(
                      child: Icon(
                        Iconsax.add,
                        color: MyColors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
