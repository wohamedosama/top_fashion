import '../../../authentication/view/onboarding/onboarding.dart';
import '../../model/cubit/cubit/user_cubit.dart';
import '../../../../utils/network/local/cache_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/widget/app_bar/app_bar.dart';
import '../../../../common/widget/image/circular_image.dart';
import '../../../../common/widget/texts/section_heading.dart';
import '../widget/profile_menu.dart';
import '../../../../utils/constants/images_string.dart';
import '../../../../utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        if (state is UserLoadingState) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is UserSuccessState) {
          return Scaffold(
            appBar:
                const CustomAppBar(title: Text('Profile'), showBackArrow: true),
            body: SingleChildScrollView(
              padding: const EdgeInsets.all(MySize.defaultSpace),
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Column(
                      children: [
                        const CircularImage(
                            image: MyImages.user, width: 80, height: 80),
                        TextButton(
                            onPressed: () {},
                            child: const Text('Change Profile Picture')),
                      ],
                    ),
                  ),
                  const SizedBox(height: MySize.spaceBtwItems / 2),
                  const Divider(),
                  const SizedBox(height: MySize.spaceBtwItems),
                  const SectionHeading(
                      title: 'Profile Information', showActionButton: false),
                  const SizedBox(height: MySize.spaceBtwItems),
                  ProfileMenu(
                      onTap: () {},
                      value: state.userLoginModel.userName!,
                      title: 'name'),
                  const SizedBox(height: MySize.spaceBtwItems / 2),
                  const Divider(),
                  const SizedBox(height: MySize.spaceBtwItems),
                  ProfileMenu(
                      onTap: () {},
                      value: state.userLoginModel.email!,
                      title: 'E-mail'),
                  ProfileMenu(
                      onTap: () {},
                      //todo mn el shared prefx
                      value: CacheHelper.getData(key: 'phoneNumber') ??
                          '01149060781',
                      title: 'Phone number'),
                  const SizedBox(height: MySize.spaceBtwItems / 2),
                  const Divider(),
                  const SizedBox(height: MySize.spaceBtwItems / 3),
                  Center(
                    child: TextButton(
                      onPressed: () {
                        CacheHelper.clearData().then((value) {
                          if (value) {
                            Navigator.pushAndRemoveUntil(
                                // ignore: use_build_context_synchronously
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const OnBoardingScreen()),
                                (route) => false);
                          }
                        });
                      },
                      child: const Text(
                        'Close Account',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
