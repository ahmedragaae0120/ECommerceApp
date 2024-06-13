import 'package:dartz/dartz.dart';
import 'package:ecommerceapp/Data/data_source_contract/remote/subCategories_datasource.dart';
import 'package:ecommerceapp/Data/models/product_response/SubcategoryModel.dart';
import 'package:ecommerceapp/Domain/entities/SubcategoryEntity.dart';
import 'package:ecommerceapp/Domain/repository_contract/subCategories_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: SubCategoriesRepository)
class SubCategoriesRepositoryImpl extends SubCategoriesRepository {
  SubCategoriesDatasource apiDataSource;
  @factoryMethod
  SubCategoriesRepositoryImpl(this.apiDataSource);
  @override
  Future<Either<List<SubcategoryEntity>, String>> getSubCategoriesSpecific(
      String categoryId) async {
    var result = await apiDataSource.getSubCategoriesSpecific(categoryId);
    return result.fold((response) {
      var subcategoriesModelList = response.data ?? [];
      // print(subcategoriesModelList);
      var subcategoryEntityList = subcategoriesModelList.map((SubcategoryModel subcategory) => subcategory.toSubcategoryEntity()).toList();
      // print(subcategoryEntityList);
      return Left(subcategoryEntityList);
    }, (error) {
      return Right(error);
    });
  }
}
