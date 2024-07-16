import 'package:bloc/bloc.dart';
import '../../models/category_model/category_model.dart';
import '../../repo.dart';
import '../../../../../utils/network/remote/dio_helper.dart';
import 'package:meta/meta.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryInitial());

  List<CategoryModel> categoriesModel = [];
  CategoryRepo categoryRepo = CategoryRepo();

  WebServices webServices = WebServices();
  List<CategoryModel> getAllCategories() {
    emit(CategoriesLoadingState());
    categoryRepo.getAllChracters().then((categoriesModel) {
      emit(CategoriesSuccessState(categoriesModel));
      this.categoriesModel = categoriesModel;
    }).catchError((error) {
      emit(CategoriesErrorState(error.toString()));
      print(error);
    });
    return categoriesModel;
  }

  void searchCategories(
    int id,
  ) {
    emit(CategoriesSearchLoadingState());
    webServices
        .getData(url: 'Categories/get-category-by-id/$id')
        .then((response) {
      final category = CategoryModel.fromJson(response.data);
      emit(CategoriesSuccessState(category as List<CategoryModel>));
    }).catchError((error) {
      emit(CategoriesSearchErrorState(error.toString()));
    });
  }
}
