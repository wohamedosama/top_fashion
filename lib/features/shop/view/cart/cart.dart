import '../../../../constants.dart';
import '../../model/cubit/basket_cubit/basket_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../common/widget/app_bar/app_bar.dart';
import 'widget/cart_items.dart';
import '../checkout/checkout_screen.dart';
import '../../../../utils/constants/sizes.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    context.read<BasketCubit>().getBasket(token!);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          showBackArrow: true,
          title:
              Text('Cart', style: Theme.of(context).textTheme.headlineMedium)),
      body: const Padding(
        padding: EdgeInsets.all(MySize.defaultSpace),
        child: CartItems(),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(MySize.defaultSpace),
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const CheckoutScreen()));
          },
          child: BlocBuilder<BasketCubit, BasketState>(
            builder: (context, state) {
              if (state is UpdateTotalPriceState) {
                return Text('${state.totalPrice} EGP');
              } else {
                return const Text('0.0 EGP ');
              }
            },
          ),
        ),
      ),
    );
  }
}
