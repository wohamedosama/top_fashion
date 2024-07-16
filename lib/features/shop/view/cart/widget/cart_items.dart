import '../../../model/cubit/basket_cubit/basket_cubit.dart';
import 'cart_item.dart';
import 'price_row.dart';
import '../../../../../utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartItems extends StatelessWidget {
  const CartItems({
    this.showOrRemoveButton = false,
    super.key,
  });
  final bool showOrRemoveButton;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BasketCubit, BasketState>(
      buildWhen: (previous, current) {
        return current is BasketLaodingState || current is BasketSuccessState;
      },
      builder: (context, state) {
        if (state is BasketLaodingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is BasketSuccessState) {
          if (state.basketModel.basketItem!.isEmpty) {
            return const Center(
              child: Text("Your Cart Is Empty"),
            );
          }
          return ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemCount: state.basketModel.basketItem!.length,
            shrinkWrap: true,
            separatorBuilder: (context, index) {
              return const SizedBox(height: MySize.spaceBtwSections);
            },
            itemBuilder: (context, index) {
              return Dismissible(
                direction: DismissDirection.endToStart,
                background: const ColoredBox(
                    color: Colors.red,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Icon(Icons.delete, color: Colors.white),
                      ),
                    )),
                key: UniqueKey(),
                onDismissed: (direction) {
                  context.read<BasketCubit>().deleteITemFromBasket(
                      state.basketModel.basketItem![index]);
                },
                child: Column(
                  children: [
                    CartItem(
                      product: state.basketModel.basketItem![index],
                    ),
                    const SizedBox(height: MySize.spaceBtwItems),
                    PriceRow(
                      basketItem: state.basketModel.basketItem![index],
                    )
                  ],
                ),
              );
            },
          );
        } else {
          return Container();
        }
      },
    );
  }
}
