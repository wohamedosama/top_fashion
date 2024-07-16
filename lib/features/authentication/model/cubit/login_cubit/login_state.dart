part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final UserLoginModel userLoginModel;
  LoginSuccess(this.userLoginModel);
}

class LoginFailure extends LoginState {
  final String errorMessage;

  LoginFailure(this.errorMessage);
}

class LoginWithGoogleSuccess extends LoginState {
  final String uId;

  LoginWithGoogleSuccess(this.uId);
}

class LoginWithGoogleFailure extends LoginState {
  final String errorMessage;

  LoginWithGoogleFailure(this.errorMessage);
}

class ChangePasswordVisibility extends LoginState {}

class AppChangeModeState extends LoginState {}
