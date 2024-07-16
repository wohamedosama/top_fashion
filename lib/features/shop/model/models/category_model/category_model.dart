class CategoryModel {
  int? id;
  String? name;
  String? description;

  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    name = json['name'] as String?;
    description = json['description'] as String; // No null check here
  }
}


// class CategoriesModel {
//   List<CategoryModel>? data;

//   CategoriesModel.fromJson(List<dynamic> jsonList) {
//     data =
//         jsonList.map((category) => CategoryModel.fromJson(category)).toList();
//   }
// }
