// ignore_for_file: avoid_print

import 'package:e_commerce/features/authentication/model/user_model/user_model.dart';
import 'package:e_commerce/utils/constants/api_constants.dart';
import '../../../../../utils/network/remote/dio_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:iconsax/iconsax.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  static LoginCubit get(context) => BlocProvider.of(context);
  WebServices webServices = WebServices();

  late UserLoginModel userLoginModel;

  void userLogin({
    required String email,
    required String password,
  }) {
    emit(LoginLoading());
    webServices.postData(url: login, data: {
      'email': email,
      'password': password,
    }).then((value) {
      userLoginModel = UserLoginModel.fromJson(value.data);

      debugPrint(userLoginModel.token);

      emit(LoginSuccess(userLoginModel));
    }).catchError((error) {
      emit(LoginFailure(error.toString()));
      print(error.toString());
    });
  }

  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    GoogleSignInAuthentication googleUserAuth =
        await googleUser!.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleUserAuth.accessToken,
      idToken: googleUserAuth.idToken,
    );
    emit(LoginSuccess(userLoginModel));

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  IconData suffix = Iconsax.eye_slash;
  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;

    suffix = isPassword ? Iconsax.eye_slash : Icons.visibility_outlined;

    emit(ChangePasswordVisibility());
  }

  bool isDark = false;

  void changeAppTheme() {
    isDark = !isDark;
    emit(AppChangeModeState());
  }
}
