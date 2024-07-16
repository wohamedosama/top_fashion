import '../../model/cubit/category_cubit/category_cubit.dart';
import '../cart/cart.dart';
import 'Widget/divider.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/helpers/helper_function.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../common/widget/app_bar/app_bar.dart';
import '../../../../common/widget/products/cart_counter_Icons.dart';
import '../../../../utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (context, state) {
        if (state is CategoriesLoadingState) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is CategoriesSuccessState) {
          return Scaffold(
            appBar: CustomAppBar(
              title: Text('Store',
                  style: Theme.of(context).textTheme.headlineMedium),
              actions: [
                CartCounterIcon(onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CartScreen()));
                })
              ],
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(MySize.defaultSpace),
                child: Column(
                  children: [
                    const SizedBox(height: MySize.spaceBtwItems),
                    //buildSearchField(context),
                    const SizedBox(height: MySize.spaceBtwItems),
                    ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        itemCount: state.categories.length,
                        shrinkWrap: true,
                        separatorBuilder: (context, index) =>
                            const DividerItem(),
                        itemBuilder: (context, index) {
                          return Row(
                            children: [
                              const SizedBox(height: 60),
                              const SizedBox(width: 20),
                              Text(
                                state.categories[index].name!,
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w500),
                              ),
                              const Spacer(),
                              // const Icon(Icons.arrow_forward_ios),
                            ],
                          );
                        }),
                    const SizedBox(height: MySize.spaceBtwItems / 2),
                  ],
                ),
              ),
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}

final searchTextController = TextEditingController();

Widget buildSearchField(BuildContext context) {
  final dark = HelperFunction.isDark(context);
  return TextField(
    onChanged: (searchCatgory) {},
    controller: searchTextController,
    cursorColor: dark ? MyColors.white : MyColors.dark,
    decoration: InputDecoration(
      prefix: const Icon(Iconsax.search_normal, color: MyColors.darkGrey),
      hintText: 'Search in Store',
      hintStyle: TextStyle(
        color: dark ? MyColors.dark : MyColors.white,
        fontSize: 18,
      ),
      border: InputBorder.none,
    ),
    style: TextStyle(
      color: dark ? MyColors.dark : MyColors.white,
      fontSize: 18,
    ),
  );
}

// class CategoriesItem extends StatelessWidget {
//   const CategoriesItem({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<ShopCubit, ShopState>(
//       builder: (context, state) {
//         return ListView.separated(
//             itemBuilder: (context, index) => const BuildCategoriesItem(),
//             separatorBuilder: (context, index) => const DividerItem(),
//             itemCount: 10);
//       },
//     );
//   }
// }




/*

NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                backgroundColor: dark ? Colors.transparent : MyColors.white,
                expandedHeight: 160,
                flexibleSpace: Padding(
                  padding: const EdgeInsets.all(MySize.defaultSpace),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: const [
                      SizedBox(height: MySize.spaceBtwItems),
                      SearchContainer(
                          text: 'Search in Store',
                          showBorder: true,
                          showBackGround: false,
                          padding: EdgeInsets.zero),
                      SizedBox(height: MySize.spaceBtwSections),
                      // SectionHeading(
                      //     title: 'Featured Brands', onPressed: () {}),
                      // const SizedBox(height: MySize.spaceBtwItems / 1.5),
                      // GridLayout(
                      //   mainAxisExtent: 80,
                      //   itemCount: 4,
                      //   itemBuilder: (context, index) => const BrandCard(),
                      // ),
                    ],
                  ),
                ),
                // bottom: const TabBarBottom(
                //   tabs: [
                //     Tab(child: Text('Sports')),
                //     Tab(child: Text('Furniture')),
                //     Tab(child: Text('Electronic')),
                //     Tab(child: Text('Clothes')),
                //     Tab(child: Text('Mohamed')),
                //   ],
                // ),
              )
            ];
          },
          body: const TabBarView(
            children: [
              CategoryTabs(),
              CategoryTabs(),
              CategoryTabs(),
              CategoryTabs(),
              CategoryTabs()
            ],
          ),
        ),

*/