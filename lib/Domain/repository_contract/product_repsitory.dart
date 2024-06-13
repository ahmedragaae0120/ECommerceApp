import 'package:dartz/dartz.dart';
import 'package:ecommerceapp/Domain/entities/ProductEntity.dart';

abstract class ProductRepo {
  Future<Either<List<ProductEntity> ,String>> getProduct({String? sort ="", String? subcategoryid = ""});
}
