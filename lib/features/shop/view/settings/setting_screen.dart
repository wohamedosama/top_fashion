import '../cart/cart.dart';
import '../checkout/checkout_screen.dart';
import '../../../../common/widget/app_bar/app_bar.dart';
import '../../../../common/widget/custom_shapes/container/primary_header_container.dart';
import '../../../../common/widget/list_tiles/setting_menu.dart';
import '../../../../common/widget/list_tiles/user_Profile_Settings.dart';
import '../../../../common/widget/texts/section_heading.dart';
import '../../../personalization/view/profile/profile.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

//Todo delete some icons depend on API calls and methods
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            PrimaryHeaderContainer(
              child: Column(
                children: [
                  CustomAppBar(
                    title: Text('Account',
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .apply(color: MyColors.white)),
                  ),
                  UserProfileSettings(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ProfileScreen()),
                      );
                    },
                  ),
                  const SizedBox(height: MySize.spaceBtwSections),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(MySize.defaultSpace),
              child: Column(
                children: [
                  const SectionHeading(
                      title: 'Account Settings', showActionButton: false),
                  const SizedBox(height: MySize.spaceBtwItems),
                  SettingMenuTile(
                      icon: Iconsax.shopping_cart,
                      title: 'My Cart',
                      subTitle: 'Add, remove products and move to checkout',
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const CartScreen()));
                      }),
                  SettingMenuTile(
                      icon: Iconsax.bag_tick,
                      title: 'My orders',
                      subTitle: 'In-progress and complete orders',
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CheckoutScreen()));
                      }),
                  const SizedBox(height: MySize.spaceBtwSections),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
