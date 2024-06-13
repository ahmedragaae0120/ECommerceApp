import 'package:dartz/dartz.dart';
import 'package:ecommerceapp/Data/data_source_contract/remote/product_datasource.dart';
import 'package:ecommerceapp/Domain/entities/ProductEntity.dart';
import 'package:ecommerceapp/Domain/repository_contract/product_repsitory.dart';
import 'package:injectable/injectable.dart';

@injectable
class MostSellingProductUsecase {
  ProductRepo productRepo;
  @factoryMethod
  MostSellingProductUsecase(this.productRepo);
  Future<Either<List<ProductEntity>, String>> call() {
    return productRepo.getProduct(sort: SortingProducts.mostSelling.sort);
  }
}
