// ignore_for_file: must_be_immutable

import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingDotNavigation extends StatelessWidget {
  OnBoardingDotNavigation({
    super.key,
    required this.pageController,
    this.onDotClicked,
  });
  var pageController = PageController();
  final void Function(int)? onDotClicked;

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunction.isDark(context);
    return Positioned(
      bottom: 85,
      left: MySize.defaultSpace,
      child: SmoothPageIndicator(
        onDotClicked: onDotClicked,
        effect: ExpandingDotsEffect(
          activeDotColor: dark ? MyColors.light : MyColors.dark,
          dotHeight: 6,
        ),
        controller: pageController,
        count: 3,
      ),
    );
  }
}
