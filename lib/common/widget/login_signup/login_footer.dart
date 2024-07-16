import '../../../features/authentication/model/cubit/login_cubit/login_cubit.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/images_string.dart';
import '../../../utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class SocialButton extends StatelessWidget {
  const SocialButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            border: Border.all(color: MyColors.grey),
          ),
          child: IconButton(
            onPressed: () {
              LoginCubit.get(context).signInWithGoogle();
            },
            icon: Image.asset(
              MyImages.google,
              width: MySize.iconMd,
              height: MySize.iconMd,
            ),
          ),
        ),
        const SizedBox(width: MySize.spaceBtwItems),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            border: Border.all(color: MyColors.grey),
          ),
          child: IconButton(
            onPressed: () {},
            icon: Image.asset(
              MyImages.facebook,
              width: MySize.iconMd,
              height: MySize.iconMd,
            ),
          ),
        ),
      ],
    );
  }
}
