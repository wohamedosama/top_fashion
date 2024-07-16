import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';

class VerticalImageText extends StatelessWidget {
  const VerticalImageText({
    required this.onTap,
    super.key,
    required this.title,
    required this.image,
    this.textColor = MyColors.white,
    this.backgroundColor,
  });

  final String title, image;
  final Color textColor;
  final Color? backgroundColor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunction.isDark(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: MySize.spaceBtwItems),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            //Circular Icon
            Container(
              width: 56,
              height: 56,
              padding: const EdgeInsets.all(MySize.md),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color:
                    backgroundColor ?? (dark ? MyColors.dark : MyColors.white),
              ),
              child: Center(
                child: Image.asset(
                  image,
                  color: dark ? MyColors.white : MyColors.dark,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: MySize.spaceBtwItems / 2),
            //Text
            SizedBox(
              width: 55,
              child: Center(
                child: Text(
                  title,
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .apply(color: textColor),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
