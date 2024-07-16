import '../../../../personalization/model/cubit/cubit/user_cubit.dart';
import '../../cart/cart.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../common/widget/app_bar/app_bar.dart';
import '../../../../../common/widget/products/cart_counter_Icons.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/text_strings.dart';
import 'package:flutter/material.dart';

class HomeAppbar extends StatelessWidget {
  const HomeAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(MyTexts.homeAppbarTitle,
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .apply(color: MyColors.grey)),
          BlocBuilder<UserCubit, UserState>(builder: (context, state) {
            if (state is UserLoadingState) {
              return Text('',
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .apply(color: MyColors.white));
            }

            if (state is UserSuccessState) {
              return Text(state.userLoginModel.userName!,
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .apply(color: MyColors.white));
            } else {
              return Container();
            }
          }),
        ],
      ),
      actions: [
        CartCounterIcon(
          onPressed: () {
            // CacheHelper.clearData().then((value) {
            //   if (value) {
            //     Navigator.pushAndRemoveUntil(
            //         // ignore: use_build_context_synchronously
            //         context,
            //         MaterialPageRoute(
            //             builder: (context) => const LoginScreen()),
            //         (route) => false);
            //   }
            // });

            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const CartScreen()));
          },
          iconColor: MyColors.white,
        ),
      ],
    );
  }
}
