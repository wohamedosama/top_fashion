import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';

class OnBoardingItems extends StatelessWidget {
  const OnBoardingItems({
    super.key,
    required this.title,
    required this.subTitle,
    required this.image,
  });

  final String title;
  final String subTitle;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(MySize.defaultSpace),
      child: Column(
        children: [
          Image.asset(
            image,
            width: HelperFunction.screenWidth(context) * 0.8,
            height: HelperFunction.screenHeight(context) * 0.6,
          ),
          Text(
            title,
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: MySize.spaceBtwItems),
          Text(
            subTitle,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
