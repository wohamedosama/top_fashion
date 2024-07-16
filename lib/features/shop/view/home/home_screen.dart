import '../../../../common/widget/products/products_card/products_cards_vertical.dart';
import '../../model/cubit/product_cubit/product_cubit.dart';
import '../search/search_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../common/widget/custom_shapes/container/primary_header_container.dart';
import '../../../../common/widget/custom_shapes/container/search_container.dart';
import '../../../../common/widget/texts/section_heading.dart';
import '../../../../utils/constants/images_string.dart';
import '../../../../utils/constants/sizes.dart';
import 'widget/home_appbar.dart';
import 'widget/home_categories.dart';

import 'widget/promo_slider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShopCubit, ShopState>(
      builder: (context, state) {
        if (state is ProductSuccessState) {
          return Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  //Header
                  PrimaryHeaderContainer(
                    child: Column(
                      children: [
                        // App bar With cart icon , title and subtitle
                        const HomeAppbar(),
                        const SizedBox(height: MySize.spaceBtwSections),

                        //searchbar
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => SearchPage()));
                          },
                          child: const SearchContainer(
                            text: 'Search In The Store',
                          ),
                        ),
                        const SizedBox(height: MySize.spaceBtwSections),

                        //  -- categories

                        const Padding(
                          padding: EdgeInsets.only(left: MySize.defaultSpace),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              // Heading
                              SectionHeading(
                                title: 'Popular Categories',
                                showActionButton: false,
                              ),
                              SizedBox(height: MySize.spaceBtwItems),

                              //Categories
                              HomeCategories()
                            ],
                          ),
                        ),
                        const SizedBox(height: MySize.spaceBtwSections * 1.5),
                      ],
                    ),
                  ),

                  //Body
                  Padding(
                    padding: const EdgeInsets.all(MySize.defaultSpace),
                    child: Column(
                      children: [
                        //Promo Slider
                        const PromoSlider(
                          banners: [
                            MyImages.banner4,
                            MyImages.banner7,
                            MyImages.banner1
                          ],
                        ),
                        const SizedBox(height: MySize.spaceBtwItems),

                        //Heading
                        SectionHeading(
                            title: 'Popular Products', onPressed: () {}),
                        const SizedBox(height: MySize.spaceBtwItems),

                        //Popular Products
                        const ProductCardVerticalHomeScreen(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }
        return Container();
      },
    );
  }
}
