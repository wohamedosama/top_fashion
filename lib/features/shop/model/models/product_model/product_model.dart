class Data {
  int? id;
  String? categoryName;
  String? productPicture;
  String? name;
  String? description;
  double? price;

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryName = json['categoryName'];
    productPicture = json['productPicture'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
  }
}

class ProductsModel {
  // int? pageNumber;
  // int? pageSize;
  // int? count;
  List<Data>? data;

  ProductsModel.fromJson(Map<String, dynamic> json) {
    data = (json['data'] as List)
        .map((product) => Data.fromJson(product))
        .toList();
  }
}
