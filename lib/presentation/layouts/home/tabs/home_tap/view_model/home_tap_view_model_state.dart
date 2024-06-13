part of 'home_tap_view_model_cubit.dart';

@immutable
abstract class HomeTapViewModelState {}

class HomeTapViewModelInitial extends HomeTapViewModelState {}
class HomeTapLoadingState extends HomeTapViewModelState {}
class HomeTapSuccessState extends HomeTapViewModelState {
  List<CategorieEntity> Categories;
  HomeTapSuccessState(this.Categories);
}
class HomeTapErrorState extends HomeTapViewModelState {
  String error;
  HomeTapErrorState(this.error);
}

class BrandsLoadingState extends HomeTapViewModelState {}
class BrandsSuccessState extends HomeTapViewModelState{
  List<BrandsEntity> brands;
  BrandsSuccessState(this.brands);
}
class BrandsErrorState extends HomeTapViewModelState{
  String error;
  BrandsErrorState(this.error);
}

class ProductLoadingState extends HomeTapViewModelState {}
class ProductSuccessState extends HomeTapViewModelState{
  List<ProductEntity> Products;
  ProductSuccessState(this.Products);
}
class ProductErrorState extends HomeTapViewModelState{
  String error;
  ProductErrorState(this.error);
}