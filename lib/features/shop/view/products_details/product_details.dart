import '../../../../common/widget/custom_shapes/container/rounded_container.dart';
import '../../../../common/widget/texts/product-title_text.dart';
import '../../../../common/widget/texts/section_heading.dart';
import 'widget/product_image_slider.dart';
import 'widget/product_meta_data.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';

class ProductsDetails extends StatelessWidget {
  const ProductsDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProductsImageSlider(),
            ProductMetaData(),
          ],
        ),
      ),
    );
  }
}

class ProductAttributes extends StatelessWidget {
  const ProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunction.isDark(context);
    return Column(
      children: [
        RoundedContainer(
          padding: const EdgeInsets.all(MySize.sm),
          backgroundColor: dark ? MyColors.darkerGrey : MyColors.grey,
          child: const Column(
            children: [
              Row(
                children: [
                  SectionHeading(title: 'variation', showActionButton: false),
                  SizedBox(width: MySize.spaceBtwItems),
                  ProductTitleText(text: 'Price', smallSie: true),
                  Row(
                    children: [],
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
