import 'package:dartz/dartz.dart';
import 'package:ecommerceapp/Data/models/subcategories_response/SubCategoriesResponse.dart';

abstract class SubCategoriesDatasource {
  Future<Either<SubCategoriesResponse,String>> getSubCategoriesSpecific(String categoryId);
}
