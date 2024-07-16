import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';

class TermsAndCondition extends StatelessWidget {
  const TermsAndCondition({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunction.isDark(context);

    return Row(
      children: [
        SizedBox(
          width: 24,
          height: 24,
          child: Checkbox(
            value: true,
            onChanged: (value) {},
          ),
        ),
        const SizedBox(
          width: MySize.spaceBtwItems,
        ),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                  text: MyTexts.iAgreeTo,
                  style: Theme.of(context).textTheme.bodySmall),
              TextSpan(
                text: '${MyTexts.privacyPolicy} ',
                style: Theme.of(context).textTheme.bodyMedium!.apply(
                    decoration: TextDecoration.underline,
                    decorationColor: dark ? MyColors.white : MyColors.primary,
                    color: dark ? MyColors.white : MyColors.primary),
              ),
              TextSpan(
                  text: MyTexts.and,
                  style: Theme.of(context).textTheme.bodySmall),
              TextSpan(
                text: ' ${MyTexts.termsOfUse} ',
                style: Theme.of(context).textTheme.bodyMedium!.apply(
                    decoration: TextDecoration.underline,
                    decorationColor: dark ? MyColors.white : MyColors.primary,
                    color: dark ? MyColors.white : MyColors.primary),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
