// ignore_for_file: must_be_immutable, unnecessary_string_interpolations

import 'package:e_commerce/common/widget/layout/grid_layout.dart';
import 'package:e_commerce/features/shop/model/cubit/basket_cubit/basket_cubit.dart';
import 'package:e_commerce/features/shop/model/cubit/product_cubit/product_cubit.dart';

import 'package:e_commerce/utils/constants/photos.dart';
import 'package:e_commerce/utils/helpers/flutter_toast/flutter_toast.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../styles/shadow.dart';
import '../../custom_shapes/container/rounded_container.dart';
import '../../image/round_image.dart';
import '../../texts/product-title_text.dart';
import '../../texts/product_price.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ProductCardVerticalHomeScreen extends StatefulWidget {
  const ProductCardVerticalHomeScreen({
    super.key,
  });

  @override
  State<ProductCardVerticalHomeScreen> createState() =>
      _ProductCardVerticalHomeScreenState();
}

class _ProductCardVerticalHomeScreenState
    extends State<ProductCardVerticalHomeScreen> {
  @override
  Widget build(BuildContext context) {
    final dark = HelperFunction.isDark(context);
    return BlocListener<BasketCubit, BasketState>(
      listener: (context, state) {
        if (state is BasketUpdateSuccessState) {
          ShowFlutterToast.showToast(
              message: 'Product Added Successfully', state: ToastState.success);
        }
        if (state is BasketUpdateErrorState) {
          ShowFlutterToast.showToast(
              message: "Something went wrong", state: ToastState.success);
        }
      },
      child: BlocBuilder<ShopCubit, ShopState>(
        builder: (context, state) {
          if (state is ProductSuccessState) {
            return GridLayout(
              itemCount: state.productModel.data!.length,
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
                      backgroundColor: dark ? MyColors.dark : MyColors.white,
                      height: 165,
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
                              text: state.productModel.data![index].name!,
                              smallSie: true),
                          const SizedBox(height: MySize.xs),
                          Row(
                            children: [
                              //'Nike',
                              Text(
                                  state.productModel.data![index].categoryName!,
                                  style:
                                      Theme.of(context).textTheme.labelMedium,
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
                          padding: const EdgeInsets.only(left: MySize.sm),
                          child: ProductPrice(
                            price: state.productModel.data![index].price!,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            context
                                .read<BasketCubit>()
                                .updateBasket(state.productModel.data![index]);
                          },
                          child: Container(
                            decoration: const BoxDecoration(
                              color: MyColors.dark,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(MySize.cardRadiusMd),
                                bottomRight:
                                    Radius.circular(MySize.productImageRadius),
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
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}
