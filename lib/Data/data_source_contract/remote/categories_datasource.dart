import 'package:dartz/dartz.dart';
import 'package:ecommerceapp/Data/models/categorie_response/CategorieResponse.dart';

abstract class CategoriesDatasource {
  Future<Either<CategorieResponse,String>> get_categories();
}
