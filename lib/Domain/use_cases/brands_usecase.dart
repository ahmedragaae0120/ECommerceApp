import 'package:dartz/dartz.dart';
import 'package:ecommerceapp/Domain/entities/BrandsEntity.dart';
import 'package:ecommerceapp/Domain/repository_contract/brands_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class BrandsUsecase {
  BrandsRepository brandsRepository;
  @factoryMethod
  BrandsUsecase(this.brandsRepository);
  Future<Either<List<BrandsEntity>, String>> call() {
    return brandsRepository.getBrands();
  }
}
