import '../../../utils/constants/api_constants.dart';

import 'package:dio/dio.dart';

class CategoriesWebSerives {
  late Dio dio;

  CategoriesWebSerives() {
    BaseOptions baseOptions = BaseOptions(
        baseUrl: baseUrl,
        receiveDataWhenStatusError: true,
        connectTimeout: const Duration(minutes: 5), //30 second
        receiveTimeout: const Duration(minutes: 5));
    dio = Dio(baseOptions);
  }

  Future<List<dynamic>> getAllCategories() async {
    Response response = await dio.get(getAllCategory);
    print(response.data);

    return response.data;
  }
}
