// ignore: file_names
import 'package:e_commerce/common/widget/image/circular_image.dart';

import 'package:e_commerce/features/personalization/model/cubit/cubit/user_cubit.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/images_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

class UserProfileSettings extends StatefulWidget {
  const UserProfileSettings({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  State<UserProfileSettings> createState() => _UserProfileSettingsState();
}

class _UserProfileSettingsState extends State<UserProfileSettings> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        if (state is UserLoadingState) {
          return ListTile(
            leading: const CircularImage(
                image: MyImages.user, width: 50, height: 50, padding: 0),
            title: Text(
              '',
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .apply(color: MyColors.white),
            ),
            subtitle: Text(
              '',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .apply(color: MyColors.white),
            ),
            trailing: IconButton(
              onPressed: widget.onPressed,
              icon: const Icon(Iconsax.edit, color: Colors.white),
            ),
          );
        }
        if (state is UserSuccessState) {
          return ListTile(
            leading: const CircularImage(
                image: MyImages.user, width: 50, height: 50, padding: 0),
            title: Text(
              state.userLoginModel.userName!,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .apply(color: MyColors.white),
            ),
            subtitle: Text(
              state.userLoginModel.email!,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .apply(color: MyColors.white),
            ),
            trailing: IconButton(
              onPressed: widget.onPressed,
              icon: const Icon(Iconsax.edit, color: Colors.white),
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
