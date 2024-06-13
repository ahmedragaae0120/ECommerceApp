import 'package:dartz/dartz.dart';
import 'package:ecommerceapp/Data/models/brands_response/BrandsResponse.dart';

abstract class BrandsDatasource {
  Future<Either<BrandsResponse,String>> getBrands();
}
