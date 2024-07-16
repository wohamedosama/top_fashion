import '../../../../../common/widget/app_bar/app_bar.dart';
import '../../../../../common/widget/custom_shapes/curved_edge/curved_edge_widget.dart';
import '../../../../../common/widget/icons/circular_icon.dart';
import '../../../../../common/widget/image/round_image.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/images_string.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ProductsImageSlider extends StatelessWidget {
  const ProductsImageSlider({
    super.key,
    this.productImage = MyImages.productImage1,
    this.sliderImage = MyImages.productImage1,
  });

  final String productImage, sliderImage;

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunction.isDark(context);

    return CurvedEdgeWidget(
      child: Container(
        color: dark ? MyColors.darkerGrey : MyColors.light,
        child: Stack(
          children: [
            SizedBox(
              height: 400,
              child: Padding(
                padding: const EdgeInsets.all(MySize.productImageRadius * 2),
                child: Center(
                  child: Image(
                    image: AssetImage(productImage),
                  ),
                ),
              ),
            ),
            Positioned(
              right: 0,
              bottom: 30,
              left: MySize.defaultSpace,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  itemCount: 5,
                  shrinkWrap: true,
                  physics: const AlwaysScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index) => RoundedImage(
                    backgroundColor: dark ? MyColors.dark : Colors.white,
                    border: Border.all(color: MyColors.primary),
                    padding: const EdgeInsets.all(MySize.sm),
                    imageUrl: sliderImage,
                  ),
                  separatorBuilder: (_, __) =>
                      const SizedBox(width: MySize.spaceBtwItems),
                ),
              ),
            ),
            CustomAppBar(
              showBackArrow: true,
              actions: [
                CircularIcon(
                  icon: Iconsax.heart5,
                  onPressed: () {},
                  color: Colors.red,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
