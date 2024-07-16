import '../../../../utils/constants/images_string.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../../../utils/helpers/helper_function.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(CupertinoIcons.clear)),
        ],
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(MySize.defaultSpace),
        child: Column(
          children: [
            // Image With 60% of screen width

            Image.asset(
              MyImages.deliveredEmailIllustration,
              width: HelperFunction.screenWidth(context) * 0.6,
            ),
            const SizedBox(height: MySize.spaceBtwSections),

            //Title &subTitle
            Text(MyTexts.changeYourPasswordTitle,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center),

            const SizedBox(height: MySize.spaceBtwItems),
            Text(MyTexts.changeYourPasswordTitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center),
            const SizedBox(height: MySize.spaceBtwSections),

            //Buttons
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text(MyTexts.done),
              ),
            ),
            const SizedBox(height: MySize.spaceBtwItems),

            SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: () {},
                child: const Text(MyTexts.resendEmail),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
