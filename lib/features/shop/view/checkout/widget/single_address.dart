import '../../../../../common/widget/custom_shapes/container/rounded_container.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class SingleAddress extends StatelessWidget {
  const SingleAddress({
    super.key,
    this.selectedAddress = false,
  });
  final bool selectedAddress;

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunction.isDark(context);
    return RoundedContainer(
      padding: const EdgeInsets.all(MySize.md),
      width: double.infinity,
      showBorder: true,
      backgroundColor: selectedAddress
          ? MyColors.primary.withOpacity(0.5)
          : Colors.transparent,
      borderColor: selectedAddress
          ? Colors.transparent
          : dark
              ? MyColors.darkerGrey
              : MyColors.grey,
      margin: const EdgeInsets.only(bottom: MySize.spaceBtwItems),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            right: 5,
            child: Icon(
              selectedAddress ? Iconsax.tick_circle5 : null,
              color: selectedAddress
                  ? dark
                      ? MyColors.light
                      : MyColors.dark
                  : null,
            ),
          ),
        ],
      ),
    );
  }
}
