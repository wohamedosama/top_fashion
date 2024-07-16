import '../../../../common/styles/spacing_style.dart';
import 'widget/login_form.dart';
import 'widget/login_header.dart';
import '../../../../utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: SpacingStyle.paddingWithAppBarHeight,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: MySize.spaceBtwSections),
            child: Column(
              children: [
                //Logo ,Title, SubTitle
                const LoginHeader(),
                const SizedBox(height: MySize.spaceBtwSections),
                //Create a Form
                LoginForm(),
                //Divider
              ],
            ),
          ),
        ),
      ),
    );
  }
}
