import 'package:dartz/dartz.dart';
import 'package:ecommerceapp/Data/data_source_contract/remote/brands_datasource.dart';
import 'package:ecommerceapp/Domain/entities/BrandsEntity.dart';
import 'package:ecommerceapp/Domain/repository_contract/brands_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: BrandsRepository)
class BrandsRepositoryImpl extends BrandsRepository {
  BrandsDatasource apiDatasource;
  @factoryMethod
  BrandsRepositoryImpl(this.apiDatasource);
  @override
  Future<Either<List<BrandsEntity>, String>> getBrands() async {
    var result = await apiDatasource.getBrands();
    return result.fold(
      (response) {
        var brandsListModel = response.data ?? [];
        var brands =
            brandsListModel.map((brand) => brand.toBrandsEntity()).toList();
        return Left(brands);
      },
      (error) => Right(error),
    );
  }
}
