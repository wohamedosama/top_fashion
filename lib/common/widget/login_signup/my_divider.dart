import '../../../utils/constants/colors.dart';
import '../../../utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';

class MyDivider extends StatelessWidget {
  const MyDivider({
    super.key,
    this.dividerText,
  });

  final String? dividerText;

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunction.isDark(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: Divider(
            color: dark ? MyColors.darkGrey : MyColors.grey,
            thickness: 0.5,
            indent: 60,
            endIndent: 5,
          ),
        ),
        Text(
          dividerText!,
          style: Theme.of(context).textTheme.labelMedium,
        ),
        Flexible(
          child: Divider(
            color: dark ? MyColors.darkGrey : MyColors.grey,
            thickness: 0.5,
            indent: 60,
            endIndent: 5,
          ),
        ),
      ],
    );
  }
}
