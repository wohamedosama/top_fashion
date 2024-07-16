import 'categories_web_serives.dart';
import 'models/category_model/category_model.dart';

class CategoryRepo {
  CategoriesWebSerives webServices = CategoriesWebSerives();

  Future<List<CategoryModel>> getAllChracters() async {
    final List<dynamic> category = await webServices.getAllCategories();

    return category
        .map((category) => CategoryModel.fromJson(category))
        .toList();
  }
}
