import '../login/login_screen.dart';
import 'success_screen.dart';
import '../../../../utils/constants/images_string.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../../../utils/helpers/helper_function.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginScreen()));
              },
              icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(MySize.defaultSpace),
          child: Column(
            children: [
              //image
              Image.asset(
                MyImages.deliveredEmailIllustration,
                width: HelperFunction.screenWidth(context) * 0.6,
              ),
              const SizedBox(height: MySize.spaceBtwSections),

              //Title &subTitle
              Text(MyTexts.confirmEmail,
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center),
              const SizedBox(height: MySize.spaceBtwItems),
              Text('Support@codingwihit.com',
                  style: Theme.of(context).textTheme.labelLarge,
                  textAlign: TextAlign.center),
              const SizedBox(height: MySize.spaceBtwItems),
              Text(MyTexts.confirmEmailSubTitle,
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.center),
              const SizedBox(height: MySize.spaceBtwSections),

              //Buttons
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SuccessScreen(
                          image: MyImages.staticSuccessIllustration,
                          title: MyTexts.yourAccountCreatedTitle,
                          subTitle: MyTexts.yourAccountCreatedSubTitle,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginScreen()));
                          },
                        ),
                      ),
                    );
                  },
                  child: const Text(MyTexts.tContinue),
                ),
              ),
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
      ),
    );
  }
}
