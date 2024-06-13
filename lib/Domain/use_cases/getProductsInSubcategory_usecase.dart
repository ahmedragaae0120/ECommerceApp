import 'package:dartz/dartz.dart';
import 'package:ecommerceapp/Domain/entities/ProductEntity.dart';
import 'package:ecommerceapp/Domain/repository_contract/product_repsitory.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetProductsInSubcategoryUsecase {
  ProductRepo productRepo;
  @factoryMethod
  GetProductsInSubcategoryUsecase(this.productRepo);
  Future<Either<List<ProductEntity>, String>> call(String subcategoryId) {
    return productRepo.getProduct(subcategoryid: subcategoryId);
  }
}
