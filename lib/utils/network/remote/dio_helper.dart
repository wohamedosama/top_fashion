// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import '../../constants/api_constants.dart';

class WebServices {
  late Dio dio;

  WebServices() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(minutes: 5),
      receiveTimeout: const Duration(minutes: 5),
      receiveDataWhenStatusError: true,
    );
    dio = Dio(options);
  }

  Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    dio.options.headers['Authorization'] = 'Bearer $token';
    print('Request URL: $url');
    print('Request Headers: ${dio.options.headers}');
    print('Request Query Parameters: $query');

    try {
      // Make the GET request
      Response response = await dio.get(url, queryParameters: query);
      return response;
    } on DioException catch (e) {
      // Handle specific status codes
      if (e.response?.statusCode == 401) {
        print('Unauthorized request: ${e.message}');
        // Handle token renewal or redirect to login
      }
      // Log and rethrow the error for further handling
      print('Dio Error: $e');
      rethrow;
    }
  }

  Future<Response> postData({
    required String url,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    Response response = await dio.post(url, queryParameters: query, data: data);
    dio.options.headers = {
      'Authorization': 'Bearer ${response.data["token"]} ',
    };
    // debugPrint(token);
    return response;
  }
}

class WebServicesBasket {
  final Dio dio = Dio(); // Assuming you already have a Dio instance

  Future<Response> getBasketItem(String id) async {
    final url =
        '${baseUrl}Basket/get-basket-item/$id'; // Assuming baseUrl is defined
    return await dio.get(url);
  }

  Future<Response> updateBasket(Map<String, dynamic> data) async {
    final url = '${baseUrl}Basket/update-basket'; // Assuming baseUrl is defined
    return await dio.post(url, data: data);
  }

  Future<Response> deleteBasket(String id) async {
    Response response =
        await dio.delete('${baseUrl}Basket/delete-basket-item/$id');
    return response;
  }
}
