part of 'basket_cubit.dart';

@immutable
sealed class BasketState {}

final class BasketInitial extends BasketState {}

final class BasketLaodingState extends BasketState {}

final class BasketSuccessState extends BasketState {
  final BasketModel basketModel;
  BasketSuccessState(this.basketModel);
}

final class BaskeErrorState extends BasketState {
  final String error;
  BaskeErrorState(this.error);
}

final class BasketUpdateLaodingState extends BasketState {}

final class BasketUpdateSuccessState extends BasketState {
  BasketUpdateSuccessState();
}

final class BasketUpdateErrorState extends BasketState {
  final String error;
  BasketUpdateErrorState(this.error);
}

final class BasketDeletedItemLaodingState extends BasketState {}

final class BasketDeletedItemSuccessState extends BasketState {
  final BasketModel basketModel;
  BasketDeletedItemSuccessState(this.basketModel);
}

final class BasketDeletedItemErrorState extends BasketState {
  final String error;
  BasketDeletedItemErrorState(this.error);
}

final class AddProductToBasketSuccessState extends BasketState {}

final class AddProductToBasketLoadingState extends BasketState {}

final class AddProductToBasketErrorState extends BasketState {}

final class UpadateProductQuantitySuccessState extends BasketState {}

final class UpadateProductQuantityLoadingState extends BasketState {}

class UpdateTotalPriceState extends BasketState {
 final  double totalPrice;
  UpdateTotalPriceState({
    required this.totalPrice,
  });
}
