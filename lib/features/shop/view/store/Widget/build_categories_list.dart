import '../../../../../utils/constants/text_strings.dart';
import 'package:flutter/material.dart';

class BuildCategoriesItem extends StatelessWidget {
  const BuildCategoriesItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        SizedBox(height: 60),
        SizedBox(width: 20),
        Text(
          MyTexts.appName,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
        Spacer(),
        Icon(Icons.arrow_forward_ios),
      ],
    );
  }
}
