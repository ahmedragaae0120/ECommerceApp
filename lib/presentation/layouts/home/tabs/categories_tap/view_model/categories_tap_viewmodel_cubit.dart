import 'package:bloc/bloc.dart';
import 'package:ecommerceapp/Domain/entities/CategorieEntity.dart';
import 'package:ecommerceapp/Domain/entities/ProductEntity.dart';
import 'package:ecommerceapp/Domain/entities/SubcategoryEntity.dart';
import 'package:ecommerceapp/Domain/use_cases/categories_usecase.dart';
import 'package:ecommerceapp/Domain/use_cases/getProductsInSubcategory_usecase.dart';
import 'package:ecommerceapp/Domain/use_cases/getSubCategoriesSpecific_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
part 'categories_tap_viewmodel_state.dart';

@injectable
class CategoriesTapViewmodel extends Cubit<CategoriesTapViewmodelState> {
  @factoryMethod
  CategoriesTapViewmodel(
      this.categoriesUsecase,
      this.getSubCategoriesSpecificUsecase,
      this.getProductsInSubcategoryUsecase)
      : super(CategoriesTapViewmodelInitial());

  static CategoriesTapViewmodel get(context) => BlocProvider.of(context);
  CategoriesUsecase categoriesUsecase;
  getCategories() async {
    emit(CategoriesLoadingState());
    var result = await categoriesUsecase.call();
    result.fold((response) {
      emit(CategoriesSuccessState(response));
    }, (error) {
      emit(CategoriesErrorState(error));
    });
  }

  GetSubCategoriesSpecificUsecase getSubCategoriesSpecificUsecase;
  getSubCategoriesSpecific(String categoryId) async {
    emit(SubCategoriesSpecificLoadingState());
    var result = await getSubCategoriesSpecificUsecase.call(categoryId);
    result.fold((response) {
      emit(SubCategoriesSpecificSuccessState(response));
    }, (error) {
      emit(SubCategoriesSpecificErrorState(error));
    });
  }

  GetProductsInSubcategoryUsecase getProductsInSubcategoryUsecase;
  getProductsInSubcategory(String subcategoryId) async {
    emit(ProductsInSubcategoryLoadingState());
    var result = await getProductsInSubcategoryUsecase.call(subcategoryId);
    result.fold((response) {
      emit(ProductsInSubcategorySuccessState(response));
    }, (error) {
      emit(ProductsInSubcategoryErrorState(error));
    });
  }
}
