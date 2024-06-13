part of 'categories_tap_viewmodel_cubit.dart';

abstract class CategoriesTapViewmodelState {}

class CategoriesTapViewmodelInitial extends CategoriesTapViewmodelState {}

class CategoriesErrorState extends CategoriesTapViewmodelState {
  String error;
  CategoriesErrorState(this.error);
}

class CategoriesLoadingState extends CategoriesTapViewmodelState {}

class CategoriesSuccessState extends CategoriesTapViewmodelState {
  List<CategorieEntity> categorieEntity;
  CategoriesSuccessState(this.categorieEntity);
}

class SubCategoriesSpecificErrorState extends CategoriesTapViewmodelState {
  String error;
  SubCategoriesSpecificErrorState(this.error);
}

class SubCategoriesSpecificLoadingState extends CategoriesTapViewmodelState {}

class SubCategoriesSpecificSuccessState extends CategoriesTapViewmodelState {
  List<SubcategoryEntity> subcategorieEntity;
  SubCategoriesSpecificSuccessState(this.subcategorieEntity);
}

class ProductsInSubcategoryErrorState extends CategoriesTapViewmodelState {
  String error;
  ProductsInSubcategoryErrorState(this.error);
}

class ProductsInSubcategoryLoadingState extends CategoriesTapViewmodelState {}

class ProductsInSubcategorySuccessState extends CategoriesTapViewmodelState {
  List<ProductEntity> products;
 ProductsInSubcategorySuccessState(this.products);
}
