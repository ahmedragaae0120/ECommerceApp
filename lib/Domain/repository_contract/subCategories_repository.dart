import 'package:dartz/dartz.dart';
import 'package:ecommerceapp/Domain/entities/SubcategoryEntity.dart';

abstract class SubCategoriesRepository {
  Future<Either<List<SubcategoryEntity>, String>> getSubCategoriesSpecific(String categoryId);
}
