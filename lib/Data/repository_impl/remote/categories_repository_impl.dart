import 'package:dartz/dartz.dart';
import 'package:ecommerceapp/Data/data_source_contract/remote/categories_datasource.dart';
import 'package:ecommerceapp/Domain/entities/CategorieEntity.dart';
import 'package:ecommerceapp/Domain/repository_contract/categories_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CategoriesRepo)
class CategoriesRepositoryImpl extends CategoriesRepo {
  CategoriesDatasource apiDatasource;
  @factoryMethod
  CategoriesRepositoryImpl(this.apiDatasource);
  @override
  Future<Either<List<CategorieEntity>, String>> get_categories() async {
    var result = await apiDatasource.get_categories();
    return result.fold((response) {
      var categoriesListModel = response.data ?? [];
      // print( categoriesListModel);
      var categories = categoriesListModel.map((categorie) => categorie.toCategorieEntity()).toList();
      // print(categories);
      return Left(categories);
    }, (error) {
      return Right(error);
    });
  }
}
