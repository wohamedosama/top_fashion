// ignore_for_file: avoid_print

import 'package:bloc/bloc.dart';
import 'package:e_commerce/constants.dart';
import 'package:e_commerce/features/shop/model/models/basket_model/basket_model.dart';
import 'package:e_commerce/features/shop/model/models/product_model/product_model.dart';
import 'package:e_commerce/utils/network/remote/dio_helper.dart';
import 'package:flutter/material.dart';

part 'basket_state.dart';

class BasketCubit extends Cubit<BasketState> {
  BasketCubit() : super(BasketInitial());
  //WebServices webServices = WebServices();
  WebServicesBasket webServicesBasket = WebServicesBasket();
  BasketModel? basketModelCache;
  double basketTotalAmount = 0;

  calculateTotalAmount(BasketModel basketModel) {
    if (basketModel.basketItem == null || basketModel.basketItem!.isEmpty) {
      basketTotalAmount = 0.0;
    }

    basketTotalAmount = basketModel.basketItem!.fold(
        0.0,
        (previousValue, element) =>
            previousValue + (element.price * element.quantity));
    emit(UpdateTotalPriceState(totalPrice: basketTotalAmount));
  }

  void getBasket(String id) {
    emit(BasketLaodingState());
    webServicesBasket.getBasketItem(id).then((value) {
      print(value.data);
      final basketModel = BasketModel.fromJson(value.data);
      basketModelCache = basketModel;
      emit(BasketSuccessState(basketModel));
      calculateTotalAmount(basketModelCache!);
    }).catchError((error) {
      emit(BaskeErrorState(error.toString()));
      print(error.toString());
    });
  }

  void updateBasket(Data product) {
    emit(BasketUpdateLaodingState());
    final index = basketModelCache!.basketItem!
        .indexWhere((item) => item.id == product.id);
    if (index != -1) {
      basketModelCache!.basketItem![index].quantity += 1;
    } else {
      BasketItems newBasketItem = BasketItems(
          id: product.id,
          productName: product.name,
          productPicture: product.productPicture,
          price: product.price,
          quantity: 1,
          category: product.categoryName);
      basketModelCache!.basketItem!.add(newBasketItem);
      calculateTotalAmount(basketModelCache!);
    }
    webServicesBasket.updateBasket(basketModelCache!.toJson()).then((value) {
      emit(BasketUpdateSuccessState());
    }).catchError((error) {
      emit(BasketUpdateErrorState(error.toString()));
      print(error.toString());
    });
  }

  void updateBasketCounter(BasketItems product, bool isAdd) {
    final index = basketModelCache!.basketItem!
        .indexWhere((item) => item.id == product.id);
    if (index != -1) {
      isAdd
          ? basketModelCache!.basketItem![index].quantity += 1
          : basketModelCache!.basketItem![index].quantity -= 1;
      calculateTotalAmount(basketModelCache!);
    }
    webServicesBasket
        .updateBasket(basketModelCache!.toJson())
        .then((value) {})
        .catchError((error) {
      emit(BasketUpdateErrorState(error.toString()));
      print(error.toString());
    });
  }

  deleteITemFromBasket(BasketItems product) {
    emit(BasketUpdateLaodingState());
    final index = basketModelCache!.basketItem!
        .indexWhere((item) => item.id == product.id);
    if (index != -1) {
      basketModelCache!.basketItem!.removeAt(index);
    }
    webServicesBasket.updateBasket(basketModelCache!.toJson()).then((value) {
      emit(BasketUpdateSuccessState());
      getBasket(token!);
    }).catchError((error) {
      emit(BasketUpdateErrorState(error.toString()));
      print(error.toString());
    });
  }

  void clearBasket() {
    emit(BasketUpdateLaodingState());
    basketModelCache!.basketItem!.clear();
    webServicesBasket.updateBasket(basketModelCache!.toJson()).then((value) {
      emit(BasketUpdateSuccessState());
      calculateTotalAmount(basketModelCache!);
    }).catchError((error) {
      emit(BasketUpdateErrorState(error.toString()));
      print(error.toString());
    });
  }
}
