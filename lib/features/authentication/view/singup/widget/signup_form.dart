// ignore_for_file: must_be_immutable
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:e_commerce/common/widget/form_field/text_form_field.dart';
import 'package:e_commerce/features/authentication/model/cubit/register_cubit/register_cubit.dart';
import 'package:e_commerce/features/authentication/model/cubit/register_cubit/register_state.dart';
import 'package:e_commerce/features/authentication/view/singup/widget/sign_up_button.dart';
import 'package:e_commerce/features/authentication/view/singup/widget/terms_condition.dart';
import 'package:e_commerce/navigation_menu.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/constants/text_strings.dart';
import 'package:e_commerce/utils/helpers/flutter_toast/flutter_toast.dart';
import 'package:e_commerce/utils/network/local/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../common/widget/login_signup/login_footer.dart';
import '../../../../../common/widget/login_signup/my_divider.dart';

class SignUpForm extends StatelessWidget {
  SignUpForm({super.key});

  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  var phoneController = TextEditingController();

  var fromKey = GlobalKey<FormState>();
  final String countryCode = '+20';
  final String phoneNumber = MyTexts.phoneNo;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state is RegisterSuccessState) {
            CacheHelper.saveData(
                key: 'token', value: state.userLoginModel.token);

            CacheHelper.saveData(
                key: 'phoneNumber', value: state.userLoginModel.phoneNumber);
            ShowFlutterToast.showToast(
              message: 'Login Success Welcome In Our App',
              state: ToastState.success,
            );
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const NavigationMenu()),
            );
          }
          if (state is RegisterFailureState) {
            ShowFlutterToast.showToast(
              message: 'Some thing worng please try again ',
              state: ToastState.error,
            );
          }
        },
        builder: (context, state) {
          return Form(
            key: fromKey,
            child: Column(
              children: [
                CustomTextFromField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your name';
                    } else {
                      return null;
                    }
                  },
                  prefixIcon: const Icon(Iconsax.user_edit),
                  textInputType: TextInputType.text,
                  controller: nameController,
                  labelText: MyTexts.username,
                ),
                const SizedBox(
                  height: MySize.spaceBtwInputFields,
                ),
                CustomTextFromField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your email';
                    } else {
                      return null;
                    }
                  },
                  prefixIcon: const Icon(Iconsax.direct),
                  textInputType: TextInputType.emailAddress,
                  controller: emailController,
                  labelText: MyTexts.email,
                ),
                const SizedBox(
                  height: MySize.spaceBtwInputFields,
                ),
                CustomTextFromField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your phone number';
                    } else {
                      return null;
                    }
                  },
                  prefixIcon: const Icon(Iconsax.call),
                  textInputType: TextInputType.phone,
                  controller: phoneController,
                  labelText: '$countryCode $phoneNumber',
                ),
                const SizedBox(
                  height: MySize.spaceBtwInputFields,
                ),
                CustomTextFromField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your password';
                    } else {
                      return null;
                    }
                  },
                  prefixIcon: const Icon(Iconsax.password_check),
                  suffixIcon: RegisterCubit.get(context).suffix,
                  isPassword: RegisterCubit.get(context).isPassword,
                  suffixPressed: () {
                    RegisterCubit.get(context).changePasswordVisibility();
                  },
                  textInputType: TextInputType.text,
                  controller: passwordController,
                  labelText: MyTexts.password,
                ),
                const SizedBox(height: MySize.spaceBtwInputFields),
                CustomTextFromField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your confirm password';
                    }
                    if (value != passwordController.text) {
                      return 'password not match';
                    }

                    return null;
                  },
                  prefixIcon: const Icon(Iconsax.password_check),
                  suffixIcon: RegisterCubit.get(context).suffixConfirmPassword,
                  isPassword: RegisterCubit.get(context).isConfirmPassword,
                  suffixPressed: () {
                    RegisterCubit.get(context)
                        .changeConfirmPasswordVisibility();
                  },
                  textInputType: TextInputType.text,
                  controller: confirmPasswordController,
                  labelText: 'Confirm Password',
                ),
                const SizedBox(height: MySize.spaceBtwInputFields),

                //Terms & Conditions CheckBox
                const TermsAndCondition(),
                const SizedBox(height: MySize.spaceBtwSections),

                //Sign UP Button
                ConditionalBuilder(
                  condition: state is! RegisterLoadingState,
                  builder: (BuildContext context) {
                    return SignUpButton(onPressed: () {
                      if (fromKey.currentState!.validate()) {
                        RegisterCubit.get(context).userRegister(
                          email: emailController.text,
                          password: passwordController.text,
                          phoneNumber: phoneController.text,
                          displayName: nameController.text,
                        );
                      }
                    });
                  },
                  fallback: (BuildContext context) {
                    return const Center(child: CircularProgressIndicator());
                  },
                ),

                const SizedBox(height: MySize.spaceBtwSections),
                //Divider
                MyDivider(dividerText: MyTexts.orSignUpWith.toUpperCase()),
                const SizedBox(height: MySize.spaceBtwSections),

                //social Button
                const SocialButton(),
              ],
            ),
          );
        },
      ),
    );
  }
}
