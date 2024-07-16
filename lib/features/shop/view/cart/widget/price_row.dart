import '../../../../../common/widget/icons/circular_icon.dart';
import '../../../../../common/widget/texts/product_price.dart';
import '../../../model/cubit/basket_cubit/basket_cubit.dart';
import '../../../model/models/basket_model/basket_model.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

class PriceRow extends StatefulWidget {
  final BasketItems basketItem;
  const PriceRow({super.key, required this.basketItem});

  @override
  State<PriceRow> createState() => _PriceRowState();
}

class _PriceRowState extends State<PriceRow> {
  int counter = 0;
  @override
  void initState() {
    counter = widget.basketItem.quantity;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunction.isDark(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            SizedBox(width: 70),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircularIcon(
                  onPressed: () {
                    if (counter > 1) {
                      setState(() {
                        counter--;
                      });

                      context
                          .read<BasketCubit>()
                          .updateBasketCounter(widget.basketItem, false);
                    } else {
                      context
                          .read<BasketCubit>()
                          .deleteITemFromBasket(widget.basketItem);
                    }
                  },
                  icon: Iconsax.minus,
                  width: 40,
                  height: 40,
                  size: MySize.md,
                  color: dark ? MyColors.white : MyColors.dark,
                  backgroundColor: dark ? MyColors.darkGrey : MyColors.light,
                ),
                const SizedBox(width: MySize.spaceBtwItems),
                BlocBuilder<BasketCubit, BasketState>(
                  builder: (context, state) {
                    return Text('${counter}',
                        style: Theme.of(context).textTheme.titleSmall);
                  },
                ),
                const SizedBox(width: MySize.spaceBtwItems),
                CircularIcon(
                  onPressed: () {
                    setState(() {
                      counter++;
                    });

                    context
                        .read<BasketCubit>()
                        .updateBasketCounter(widget.basketItem, true);
                  },
                  icon: Iconsax.add,
                  width: 40,
                  height: 40,
                  size: MySize.md,
                  color: MyColors.white,
                  backgroundColor: MyColors.primary,
                ),
              ],
            )
          ],
        ),
        ProductPrice(price: widget.basketItem.price! * counter),
      ],
    );
  }
}
