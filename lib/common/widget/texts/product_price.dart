import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ProductPrice extends StatelessWidget {
  ProductPrice({
    super.key,
    this.currencySign = ' EGP',
    required this.price,
    this.maxLine = 1,
    this.isLarge = false,
    this.lineThrough = false,
  });

  final String currencySign;

  dynamic price;
  final int maxLine;
  final bool isLarge;
  final bool lineThrough;

  @override
  Widget build(BuildContext context) {
    return Text(
      '$price$currencySign',
      maxLines: maxLine,
      overflow: TextOverflow.ellipsis,
      style: isLarge
          ? Theme.of(context).textTheme.headlineMedium!.apply(
              decoration: lineThrough ? TextDecoration.lineThrough : null)
          : Theme.of(context).textTheme.titleLarge!.apply(
              decoration: lineThrough ? TextDecoration.lineThrough : null),
    );
  }
}
