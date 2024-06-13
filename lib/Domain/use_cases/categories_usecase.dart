import 'package:dartz/dartz.dart';
import 'package:ecommerceapp/Domain/entities/CategorieEntity.dart';
import 'package:ecommerceapp/Domain/repository_contract/categories_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class CategoriesUsecase {
  CategoriesRepo categoriesRepo;
  @factoryMethod
  CategoriesUsecase(this.categoriesRepo);
  Future<Either<List<CategorieEntity>, String>> call() {
    return categoriesRepo.get_categories();
  }
}
