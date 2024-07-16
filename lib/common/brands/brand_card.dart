import '../widget/custom_shapes/container/rounded_container.dart';
import '../widget/image/circular_image.dart';
import '../../features/shop/view/store/Widget/brand_title_with_verification_icon.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/enums.dart';
import '../../utils/constants/images_string.dart';
import '../../utils/constants/sizes.dart';
import '../../utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';

class BrandCard extends StatelessWidget {
  const BrandCard({
    super.key,
    this.onTap,
    this.showBorder = true,
  });

  final void Function()? onTap;
  final bool showBorder;

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunction.isDark(context);

    return GestureDetector(
      onTap: onTap,
      child: RoundedContainer(
        padding: const EdgeInsets.all(MySize.sm),
        showBorder: showBorder,
        backgroundColor: Colors.transparent,
        child: Row(
          children: [
            //Icon
            Flexible(
              child: CircularImage(
                isNetworkImage: false,
                image: MyImages.clothIcon,
                backgroundColor: Colors.transparent,
                overlayColor: dark ? MyColors.white : MyColors.black,
              ),
            ),
            const SizedBox(width: MySize.spaceBtwItems / 2),

            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const BrandTitleWithVerification(
                    title: 'Nike',
                    brandTextSize: TextSizes.large,
                  ),
                  Text(
                    '256 Products',
                    style: Theme.of(context).textTheme.labelMedium,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
