// ignore_for_file: must_be_immutable
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:e_commerce/common/widget/form_field/text_form_field.dart';
import 'package:e_commerce/common/widget/login_signup/login_footer.dart';
import 'package:e_commerce/common/widget/login_signup/my_divider.dart';
import 'package:e_commerce/features/authentication/model/cubit/login_cubit/login_cubit.dart';
import 'package:e_commerce/features/authentication/view/singup/signup_screen.dart';
import 'package:e_commerce/navigation_menu.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/constants/text_strings.dart';
import 'package:e_commerce/utils/helpers/flutter_toast/flutter_toast.dart';
import 'package:e_commerce/utils/network/local/cache_helper.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

class LoginForm extends StatelessWidget {
  LoginForm({super.key});

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  final bool isPassword = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            ShowFlutterToast.showToast(
              message: 'Login Success Welcome In Our App',
              state: ToastState.success,
            );
            CacheHelper.saveData(
                key: 'token', value: (state).userLoginModel.token);

            CacheHelper.saveData(
                key: 'userName', value: state.userLoginModel.userName);

            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const NavigationMenu(),
              ),
            );
          }

          if (state is LoginFailure) {
            ShowFlutterToast.showToast(
              message: 'Some thing worng please try again ',
              state: ToastState.error,
            );
          }
        },
        builder: (context, state) => Form(
          key: formKey,
          child: Column(
            children: [
              //Email
              CustomTextFromField(
                prefixIcon: const Icon(Iconsax.direct_right),
                textInputType: TextInputType.emailAddress,
                controller: emailController,
                labelText: MyTexts.email,
              ),
              const SizedBox(height: MySize.spaceBtwInputFields),

              // ),
              CustomTextFromField(
                prefixIcon: const Icon(Iconsax.password_check),
                textInputType: TextInputType.visiblePassword,
                controller: passwordController,
                labelText: MyTexts.password,
                onFieldSubmitted: (value) {
                  if (formKey.currentState!.validate()) {
                    LoginCubit.get(context).userLogin(
                      email: emailController.text,
                      password: passwordController.text,
                    );
                  }
                },
                suffixIcon: LoginCubit.get(context).suffix,
                isPassword: LoginCubit.get(context).isPassword,
                suffixPressed: () {
                  LoginCubit.get(context).changePasswordVisibility();
                },
              ),
              const SizedBox(height: MySize.spaceBtwInputFields),

              //Remember me & forget Password

              //sign In Button
              ConditionalBuilder(
                condition: state is! LoginLoading,
                builder: (context) => SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          LoginCubit.get(context).userLogin(
                              email: emailController.text,
                              password: passwordController.text);
                        }
                      },
                      child: const Text(MyTexts.signIn)),
                ),
                fallback: (BuildContext context) {
                  return const Center(child: CircularProgressIndicator());
                },
              ),
              const SizedBox(height: MySize.spaceBtwItems),

              //Create an Account
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignUpScreen()));
                    },
                    child: const Text(MyTexts.createAccount)),
              ),
              const SizedBox(height: MySize.spaceBtwSections),
              MyDivider(dividerText: MyTexts.orSignInWith.toUpperCase()),
              const SizedBox(height: MySize.spaceBtwSections),
              //Footer
              const SocialButton(),
            ],
          ),
        ),
      ),
    );
  }
}
