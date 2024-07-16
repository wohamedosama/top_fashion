import '../../user_model/user_model.dart';
import 'package:flutter/material.dart';

@immutable
abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterLoadingState extends RegisterState {}

class RegisterSuccessState extends RegisterState {
  final UserLoginModel userLoginModel;
  RegisterSuccessState(this.userLoginModel);
}

class RegisterFailureState extends RegisterState {
  final String errorMessage;
  RegisterFailureState(this.errorMessage);
}

class ChangePasswordVisibility extends RegisterState {}

class ChangeConfirmPasswordVisibility extends RegisterState {}
