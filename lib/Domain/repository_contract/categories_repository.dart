import 'package:dartz/dartz.dart';
import 'package:ecommerceapp/Domain/entities/CategorieEntity.dart';

abstract class CategoriesRepo {
  Future<Either<List<CategorieEntity>,String>> get_categories();
}
