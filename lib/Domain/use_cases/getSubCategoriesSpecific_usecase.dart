import 'package:dartz/dartz.dart';
import 'package:ecommerceapp/Domain/entities/SubcategoryEntity.dart';
import 'package:ecommerceapp/Domain/repository_contract/subCategories_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetSubCategoriesSpecificUsecase {
  SubCategoriesRepository subCategoriesRepo;
  @factoryMethod
  GetSubCategoriesSpecificUsecase(this.subCategoriesRepo);

  Future<Either<List<SubcategoryEntity>, String>> call(String categoryId) => subCategoriesRepo.getSubCategoriesSpecific(categoryId);
}
