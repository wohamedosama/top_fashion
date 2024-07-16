import 'package:e_commerce/features/shop/model/cubit/product_cubit/product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/styles/shadow.dart';
import '../../../../common/widget/custom_shapes/container/rounded_container.dart';
import '../../../../common/widget/image/round_image.dart';
import '../../../../common/widget/layout/grid_layout.dart';
import '../../../../common/widget/texts/product-title_text.dart';
import '../../../../common/widget/texts/product_price.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/photos.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_function.dart';

class SearchPage extends StatelessWidget {
  SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunction.isDark(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              context.read<ShopCubit>().getAllProducts();
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)),
        title: const Text("Search Products"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              buildSearchField(context),
              const SizedBox(
                height: 20,
              ),
              BlocBuilder<ShopCubit, ShopState>(
                builder: (context, state) {
                  if (state is GetSearchItemsLoadingState) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state is GetSearchItemsSuccessState) {
                    return GridLayout(
                      itemCount: state.searchProducts!.length,
                      itemBuilder: (_, index) => Container(
                        width: 180,
                        padding: const EdgeInsets.all(1),
                        height: 220,
                        decoration: BoxDecoration(
                          boxShadow: [ShadowStyle.verticalProductShadow],
                          borderRadius:
                              BorderRadius.circular(MySize.productImageRadius),
                          color: dark ? MyColors.darkerGrey : MyColors.white,
                        ),
                        child: Column(
                          children: [
                            //Thumbnails, wishlist Button,Discount tag,
                            RoundedContainer(
                              backgroundColor:
                                  dark ? MyColors.dark : MyColors.white,
                              height: 160,
                              padding: const EdgeInsets.all(MySize.sm),
                              child: Stack(
                                children: [
                                  //Product Image
                                  RoundedImage(
                                    backgroundColor:
                                        dark ? MyColors.dark : MyColors.white,
                                    imageUrl: MyPhotos.images[index],
                                    applyImageRadius: true,
                                  ),
                                  //Sale Tag
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
                                  ProductTitleText(
                                      text: state.searchProducts![index].name!,
                                      smallSie: true),
                                  const SizedBox(height: MySize.xs),
                                  Row(
                                    children: [
                                      //'Nike',
                                      Text(
                                          state.searchProducts![index]
                                              .categoryName!,
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelMedium,
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
                                  padding:
                                      const EdgeInsets.only(left: MySize.sm),
                                  child: ProductPrice(
                                    price: state.searchProducts![index].price!,
                                  ),
                                ),
                                Container(
                                  decoration: const BoxDecoration(
                                    color: MyColors.dark,
                                    borderRadius: BorderRadius.only(
                                      topLeft:
                                          Radius.circular(MySize.cardRadiusMd),
                                      bottomRight: Radius.circular(
                                          MySize.productImageRadius),
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
                  } else {
                    return const Center();
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  final searchTextController = TextEditingController();

  Widget buildSearchField(BuildContext context) {
    final dark = HelperFunction.isDark(context);
    return Padding(
      padding: const EdgeInsets.all(MySize.defaultSpace / 2),
      child: TextField(
        autofocus: true,
        onChanged: (query) {
          context.read<ShopCubit>().getSearchProducts(query);
        },
        controller: searchTextController,
        cursorColor: dark ? MyColors.white : MyColors.dark,
        decoration: InputDecoration(
          prefix: const Icon(Iconsax.search_normal, color: MyColors.darkGrey),
          hintText: '   Search in Store',
          hintStyle: TextStyle(
            color: dark ? MyColors.white : MyColors.dark,
            fontSize: 18,
          ),
          border: InputBorder.none,
        ),
        style: TextStyle(
          color: dark ? MyColors.white : MyColors.dark,
          fontSize: 18,
        ),
      ),
    );
  }
}
