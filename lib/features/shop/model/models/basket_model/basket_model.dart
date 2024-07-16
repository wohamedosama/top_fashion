class BasketModel {
  String? id;
  dynamic deliveryMethodId;
  String? clientSecret;
  String? paymentIntentId;
  dynamic shippingPrice;
  List<BasketItems>? basketItem;

  BasketModel({
    this.id,
    this.deliveryMethodId,
    this.clientSecret,
    this.paymentIntentId,
    this.shippingPrice,
    this.basketItem,
  });

  factory BasketModel.fromJson(Map<String, dynamic> json) {
    return BasketModel(
      id: json['id'] ?? '0',
      deliveryMethodId: json['deliveryMethodId'] ?? 0,
      clientSecret: json['clientSecret'] ?? " ",
      paymentIntentId: json['paymentIntentId'] ?? " ",
      shippingPrice: json['shippingPrice'] ?? 0,
      basketItem: json['basketItems'] != null ? (json['basketItems'] as List).map((item) => BasketItems.fromJson(item)).toList() : [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'deliveryMethodId': deliveryMethodId,
      'clientSecret': clientSecret,
      'paymentIntentId': paymentIntentId,
      'shippingPrice': shippingPrice,
      'basketItems': basketItem?.map((item) => item.toJson()).toList(),
    };
  }
}

class BasketItems {
  dynamic id;
  String? productName; // Renamed for clarity
  String? productPicture;
  dynamic price;
  dynamic quantity;
  String? category;

  BasketItems({
    required this.id,
    required this.productName,
    required this.productPicture,
    required this.price,
    required this.quantity,
    required this.category,
  });

  factory BasketItems.fromJson(Map<String, dynamic> json) {
    return BasketItems(id: json['id'], productName: json['productName'], productPicture: json['productPicture'], price: json['price'], quantity: json['quantity'], category: json['category']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'productName': productName, // Renamed for clarity in output
      'productPicture': productPicture,
      'price': price,
      'quantity': quantity,
      'category': category,
    };
  }
}
