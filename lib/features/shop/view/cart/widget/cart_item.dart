import '../../../model/models/basket_model/basket_model.dart';
import '../../../../../utils/constants/photos.dart';
import 'package:flutter/widgets.dart';
import '../../../../../common/widget/image/round_image.dart';
import '../../../../../common/widget/texts/product-title_text.dart';
import '../../../../../utils/constants/colors.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_function.dart';

class CartItem extends StatelessWidget {
  final BasketItems product;

  const CartItem({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunction.isDark(context);
    return Row(
      children: [
        RoundedImage(
          imageUrl: MyPhotos.images[product.id - 1],
          width: 60,
          height: 60,
          backgroundColor: dark ? MyColors.darkGrey : MyColors.white,
        ),
        const SizedBox(
          width: MySize.spaceBtwItems,
        ),
        Column(
          children: [
            ProductTitleText(
              text: product.productName!,
              maxLines: 1,
            ),
          ],
        ),
      ],
    );
  }
}
