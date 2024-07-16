// ignore_for_file: avoid_print

import 'package:dio/dio.dart';

class WebServicesUserData {
  late Dio dio;

  WebServicesUserData() {
    BaseOptions options = BaseOptions(
      connectTimeout: const Duration(minutes: 5),
      receiveTimeout: const Duration(minutes: 5),
      receiveDataWhenStatusError: true,
    );
    dio = Dio(options);
  }

  Future<Response> getDataUserData({
    String url =
        'https://organic-coral-internally.ngrok-free.app/api/Account/get-current-user',
    Map<String, dynamic>? query,
    String? token,
  }) async {
    // Make the GET request
    Response response = await dio.get(url, queryParameters: query);
    dio.options.headers = {
      'Authorization': 'Bearer ${response.data["token"]} ',
    };

    return response;
  }
}
