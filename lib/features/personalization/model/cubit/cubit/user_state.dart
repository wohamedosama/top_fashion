part of 'user_cubit.dart';

sealed class UserState {}

final class UserInitial extends UserState {}

class UserLoadingState extends UserState {}

class UserSuccessState extends UserState {
  final UserLoginModel userLoginModel;
  UserSuccessState(this.userLoginModel);
}

class UserErrorState extends UserState {
  final String error;
  UserErrorState(this.error);
}

class UserProfileImageSuccessState extends UserState {}

class UserProfileImageFailureState extends UserState {
  final String error;
  UserProfileImageFailureState(this.error);
}

class UserUpadateProfileImageSuccessState extends UserState {}

class UserUpdateProfileImageFailureState extends UserState {
  final String error;
  UserUpdateProfileImageFailureState(this.error);
}
