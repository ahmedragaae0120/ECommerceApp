import 'package:dartz/dartz.dart';
import 'package:ecommerceapp/Domain/entities/ProductEntity.dart';
import 'package:ecommerceapp/Domain/repository_contract/product_repsitory.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProductUsecase {
  ProductRepo productRepo;
  @factoryMethod
  ProductUsecase(this.productRepo);
  Future<Either<List<ProductEntity>, String>> call() {
    return productRepo.getProduct();
  }
}
