import 'package:bloc/bloc.dart';
import '../../../../authentication/model/user_model/user_model.dart';

import '../../models/product_model/product_model.dart';
import '../../../../../utils/constants/api_constants.dart';
import '../../../../../utils/network/remote/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'product_state.dart';

class ShopCubit extends Cubit<ShopState> {
  ShopCubit() : super(ProductInitial());

  late ProductsModel productsModel;

  WebServices webServices = WebServices();
  late UserLoginModel loginModel;

  void getAllProducts() async {
    emit(ProductLoadingState());
    try {
      final response = await webServices.getData(
        url: getAllProduct,
      );
      productsModel = ProductsModel.fromJson(response.data);
      emit(ProductSuccessState(productsModel));
    } catch (error) {
      emit(ProductFailureState(error.toString()));
    }

    //     .then((value) {
    //   productsModel = ProductsModel.fromJson(value.data);
    //   emit(ProductSuccessState(productsModel));
    // }).catchError((error) {
    //   emit(ProductFailureState(error.toString()));
    // });
  }

  getSearchProducts(String query) {
    emit(GetSearchItemsLoadingState());
    if (query.isEmpty) {
      emit(GetSearchItemsErrorState(errorMessage: "no items found"));
    } else {
      emit(GetSearchItemsSuccessState(
          searchProducts: productsModel.data
              ?.where((product) =>
                  product.name!.toLowerCase().contains(query.toLowerCase()))
              .toList()));
    }
  }
}
