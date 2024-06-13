import 'package:bloc/bloc.dart';
import 'package:ecommerceapp/Domain/entities/BrandsEntity.dart';
import 'package:ecommerceapp/Domain/entities/CategorieEntity.dart';
import 'package:ecommerceapp/Domain/entities/ProductEntity.dart';
import 'package:ecommerceapp/Domain/use_cases/brands_usecase.dart';
import 'package:ecommerceapp/Domain/use_cases/categories_usecase.dart';
import 'package:ecommerceapp/Domain/use_cases/most_selling_product_usecase.dart';
import 'package:ecommerceapp/Domain/use_cases/product_usecase.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

part 'home_tap_view_model_state.dart';

@injectable
class HomeTapViewModelCubit extends Cubit<HomeTapViewModelState> {
  @factoryMethod
  HomeTapViewModelCubit(this.categoriesUsecase, this.brandsUsecase, this.productUsecase, this.mostSellingProductUsecase)
      : super(HomeTapViewModelInitial());

  final CategoriesUsecase categoriesUsecase;
  getCategories() async {
    emit(HomeTapLoadingState());
    var result = await categoriesUsecase.call();
    result.fold((categoriesRespone) {
      emit(HomeTapSuccessState(categoriesRespone));
    }, (error) {
      emit(HomeTapErrorState(error));
    });
  }

  final BrandsUsecase brandsUsecase;
  getBrands() async {
    emit(BrandsLoadingState());
    var result = await brandsUsecase.call();
    result.fold((brands) {
      emit(BrandsSuccessState(brands));
    }, (error) {
      emit(BrandsErrorState(error));
    });
  }

  final ProductUsecase productUsecase;
  getProducts() async {
    emit(ProductLoadingState());
    var result = await productUsecase.call();
    result.fold((products) {
      emit(ProductSuccessState(products));
    }, (error) {
      emit(ProductErrorState(error));
    });
  }

  final MostSellingProductUsecase mostSellingProductUsecase;
  getMostSellingProduct() async{
        emit(ProductLoadingState());
    var result = await mostSellingProductUsecase.call();
    result.fold((products) {
      emit(ProductSuccessState(products));
    }, (error) {
      emit(ProductErrorState(error));
    });
  }
}
