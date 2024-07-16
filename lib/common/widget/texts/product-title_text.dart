// ignore_for_file: file_names

import 'package:flutter/material.dart';

class ProductTitleText extends StatelessWidget {
  const ProductTitleText({
    super.key,
    required this.text,
    this.smallSie = false,
    this.maxLines = 2,
    this.textAlign = TextAlign.left,
  });

  final String text;
  final bool smallSie;
  final int maxLines;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: smallSie
          ? Theme.of(context).textTheme.labelLarge
          : Theme.of(context).textTheme.titleSmall,
      overflow: TextOverflow.ellipsis,
      maxLines: maxLines,
      textAlign: textAlign,
    );
  }
}
