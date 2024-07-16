import '../../../model/cubit/basket_cubit/basket_cubit.dart';
import '../../../../../utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BillingPaymentSection extends StatelessWidget {
  const BillingPaymentSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child:
                  Text('Total', style: Theme.of(context).textTheme.bodyLarge),
            ),
            BlocBuilder<BasketCubit, BasketState>(
              builder: (context, state) {
                if (state is UpdateTotalPriceState) {
                  return Text('${state.totalPrice} EGP',
                      style: Theme.of(context).textTheme.bodyLarge);
                } else {
                  return Text('0',
                      style: Theme.of(context).textTheme.bodyLarge);
                }
              },
            )
          ],
        ),
        const SizedBox(height: MySize.spaceBtwItems / 2)
      ],
    );
  }
}
