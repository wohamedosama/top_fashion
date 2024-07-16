import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../../../utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
    required this.onPressed,
  });

  final String image, title, subTitle;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: MySize.appBarHeight,
            left: MySize.defaultSpace,
            right: MySize.defaultSpace,
            bottom: MySize.defaultSpace,
          ),
          child: Column(
            children: [
              Image.asset(
                image,
                width: HelperFunction.screenWidth(context) * 0.6,
              ),
              const SizedBox(height: MySize.spaceBtwSections),

              //Title &subTitle
              Text(title,
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center),

              const SizedBox(height: MySize.spaceBtwItems),
              Text(subTitle,
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.center),
              const SizedBox(height: MySize.spaceBtwSections),

              //Buttons
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: onPressed,
                  child: const Text(MyTexts.tContinue),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
//MyImages.staticSuccessIllustration,

//MyTexts.yourAccountCreatedTitle

//MyTexts.yourAccountCreatedSubTitle
//() {
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => const LoginScreen()));
//                   },
