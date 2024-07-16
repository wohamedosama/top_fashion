// import 'package:e_commerce/common/widget/icons/circular_icon.dart';
// import 'package:e_commerce/features/shop/model/cubit/basket_cubit/basket_cubit.dart';
// import 'package:e_commerce/features/shop/model/models/basket_model/basket_model.dart';
// import 'package:e_commerce/utils/constants/colors.dart';
// import 'package:e_commerce/utils/constants/sizes.dart';
// import 'package:e_commerce/utils/helpers/helper_function.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:iconsax/iconsax.dart';

// class AddOrRemoveItemFromCart extends StatefulWidget {
//   final BasketItems product;
//   int counter = 0;

//   AddOrRemoveItemFromCart({
//     Key? key,
//     required this.product,
//     required this.counter,
//   }) : super(key: key);

//   @override
//   State<AddOrRemoveItemFromCart> createState() => _AddOrRemoveItemFromCartState();
// }

// class _AddOrRemoveItemFromCartState extends State<AddOrRemoveItemFromCart> {
//   // int counter = 0;
//   @override
//   void initState() {
//     widget.counter = widget.product.quantity;

//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final dark = HelperFunction.isDark(context);
//     return Row(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         CircularIcon(
//           onPressed: () {
//             if (widget.counter > 1) {
//               setState(() {
//                 widget.counter--;
//               });

//               context.read<BasketCubit>().updateBasketCounter(widget.product, false);
//             } else {
//               context.read<BasketCubit>().deleteITemFromBasket(widget.product);
//             }
//           },
//           icon: Iconsax.minus,
//           width: 40,
//           height: 40,
//           size: MySize.md,
//           color: dark ? MyColors.white : MyColors.dark,
//           backgroundColor: dark ? MyColors.darkGrey : MyColors.light,
//         ),
//         const SizedBox(width: MySize.spaceBtwItems),
//         BlocBuilder<BasketCubit, BasketState>(
//           builder: (context, state) {
//             return Text('${widget.counter}', style: Theme.of(context).textTheme.titleSmall);
//           },
//         ),
//         const SizedBox(width: MySize.spaceBtwItems),
//         CircularIcon(
//           onPressed: () {
//             setState(() {
//               widget.counter++;
//             });

//             context.read<BasketCubit>().updateBasketCounter(widget.product, true);
//           },
//           icon: Iconsax.add,
//           width: 40,
//           height: 40,
//           size: MySize.md,
//           color: MyColors.white,
//           backgroundColor: MyColors.primary,
//         ),
//       ],
//     );
//   }
// }
