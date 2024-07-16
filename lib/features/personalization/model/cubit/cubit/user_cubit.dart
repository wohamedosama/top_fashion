// ignore_for_file: avoid_print

import 'package:bloc/bloc.dart';
import 'package:e_commerce/constants.dart';
import 'package:e_commerce/features/authentication/model/user_model/user_model.dart';

import 'package:e_commerce/utils/constants/api_constants.dart';
import 'package:e_commerce/utils/network/local/cache_helper.dart';
import 'package:e_commerce/utils/network/remote/dio_helper.dart';
import 'dart:io';

import 'package:image_picker/image_picker.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());
  WebServices webServices = WebServices();
  UserLoginModel? userLoginModel;

  File? image;
  final ImagePicker picker = ImagePicker();

  void getUserData() {
    emit(UserLoadingState());
    print(token);
    webServices
        .getData(
      url: getCurrentUser,
      token: CacheHelper.getData(key: 'token'),
    )
        .then((value) {
      userLoginModel = UserLoginModel.fromJson(value.data);

      emit(UserSuccessState(userLoginModel!));
    }).catchError((error) {
      emit(UserErrorState(error.toString()));
      print(error.toString());
    });
  }

  Future<void> pickImage() async {
    final pickFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickFile != null) {
      image = File(pickFile.path);
      await CacheHelper.saveData(key: 'userImage', value: image);
      emit(UserProfileImageSuccessState());
    } else {
      emit(UserProfileImageFailureState('No image Selected'));
    }
  }

  Future<void> retriveImage() async {
    image = await CacheHelper.getData(key: 'userImage');
    emit(UserUpadateProfileImageSuccessState());
  }
}
