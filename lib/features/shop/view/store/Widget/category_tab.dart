import '../../../../../common/widget/products/products_card/products_cards_vertical_category_screen.dart';

import '../../../../../common/brands/brand_show_case.dart';
import '../../../../../common/widget/layout/grid_layout.dart';
import '../../../../../common/widget/texts/section_heading.dart';

import '../../../../../utils/constants/images_string.dart';
import '../../../../../utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class CategoryTabs extends StatelessWidget {
  const CategoryTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(MySize.defaultSpace),
          child: Column(
            children: [
              const BrandShowCase(images: [
                MyImages.productImage1,
                MyImages.productImage2,
                MyImages.productImage3
              ]),
              const SizedBox(height: MySize.spaceBtwItems),
              SectionHeading(title: 'You might Like', onPressed: () {}),
              const SizedBox(height: MySize.spaceBtwItems),
              GridLayout(
                  itemCount: 8,
                  itemBuilder: (_, index) => const ProductCardVertical())
            ],
          ),
        ),
      ],
    );
  }
}
