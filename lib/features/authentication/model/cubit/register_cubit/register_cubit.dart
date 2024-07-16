// ignore_for_file: avoid_print

import 'package:e_commerce/constants.dart';
import 'package:e_commerce/features/authentication/model/cubit/register_cubit/register_state.dart';
import 'package:e_commerce/utils/constants/api_constants.dart';
import 'package:e_commerce/utils/network/remote/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:e_commerce/features/authentication/model/user_model/user_model.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  static RegisterCubit get(context) => BlocProvider.of(context);
  late UserLoginModel userLoginModel;
  WebServices webServices = WebServices();

  void userRegister({
    required String email,
    required String password,
    required String phoneNumber,
    required String displayName,
  }) {
    emit(RegisterLoadingState());
    webServices
        .postData(
      url: register,
      data: {
        'email': email,
        'password': password,
        'displayName': displayName,
        'phoneNumber': phoneNumber,
      },
      token: token,
    )
        .then((value) {
      userLoginModel = UserLoginModel.fromJson(value.data);
      print(userLoginModel.token);

      emit(RegisterSuccessState(userLoginModel));
    }).catchError((error) {
      emit(
        RegisterFailureState('Your email is invaild'),
      );

      print(error.toString());
    });
  }

  bool isPassword = true;
  IconData suffix = Iconsax.eye_slash;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix = isPassword ? Iconsax.eye_slash : Icons.visibility_outlined;

    emit(ChangePasswordVisibility());
  }

  bool isConfirmPassword = true;
  IconData suffixConfirmPassword = Iconsax.eye_slash;

  void changeConfirmPasswordVisibility() {
    isConfirmPassword = !isConfirmPassword;
    suffixConfirmPassword =
        isConfirmPassword ? Iconsax.eye_slash : Icons.visibility_outlined;
    emit(ChangeConfirmPasswordVisibility());
  }
}
