import 'package:dartz/dartz.dart';
import 'package:ecommerceapp/Domain/entities/BrandsEntity.dart';

abstract class BrandsRepository {
  Future<Either<List<BrandsEntity>, String>> getBrands();
}
