part of 'product_cubit.dart';

@immutable
sealed class ShopState {}

final class ProductInitial extends ShopState {}

class ProductLoadingState extends ShopState {}

class ProductSuccessState extends ShopState {
  final ProductsModel productModel;

  ProductSuccessState(this.productModel);
}

class ProductFailureState extends ShopState {
  final String error;
  ProductFailureState(this.error);
}

class GetSearchItemsSuccessState extends ShopState {
  final List<Data>? searchProducts;
  GetSearchItemsSuccessState({
    required this.searchProducts,
  });
}

class GetSearchItemsErrorState extends ShopState {
  final String errorMessage;
  GetSearchItemsErrorState({
    required this.errorMessage,
  });
}

class GetSearchItemsLoadingState extends ShopState {}
