class UserLoginModel {
  String? phoneNumber;
  String? message;
  String? email;
  String? password; // مش بيرحع داتا
  String? token;
  String? userName; // مش بيرحع داتا
  UserLoginModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
    message = json['message'];
    token = json['token'];
    userName = json['displayName'];
    phoneNumber = json['phoneNumber'];
  }
}
