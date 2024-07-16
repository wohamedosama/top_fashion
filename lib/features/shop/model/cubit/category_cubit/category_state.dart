part of 'category_cubit.dart';

@immutable
sealed class CategoryState {}

final class CategoryInitial extends CategoryState {}

class CategoriesLoadingState extends CategoryState {}

class CategoriesSuccessState extends CategoryState {
  final List<CategoryModel> categories;
  CategoriesSuccessState(this.categories);
}

class CategoriesErrorState extends CategoryState {
  final String error;
  CategoriesErrorState(this.error);
}

class CategoriesSearchLoadingState extends CategoryState {}

class CategoriesSearchSucessState extends CategoryState {
  final List<CategoryModel> categories;
  CategoriesSearchSucessState(this.categories);
}

class CategoriesSearchErrorState extends CategoryState {
  final String error;
  CategoriesSearchErrorState(this.error);
}
