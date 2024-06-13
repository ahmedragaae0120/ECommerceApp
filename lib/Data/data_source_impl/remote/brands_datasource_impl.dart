import 'package:dartz/dartz.dart';
import 'package:ecommerceapp/Data/data_source_contract/remote/brands_datasource.dart';
import 'package:ecommerceapp/Data/models/brands_response/BrandsResponse.dart';
import 'package:ecommerceapp/core/api/api_manager.dart';
import 'package:ecommerceapp/core/api/endpoints.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: BrandsDatasource)
class BrandsDatasourceImpl extends BrandsDatasource {
  ApiManager apiManager;
  @factoryMethod
  BrandsDatasourceImpl(this.apiManager);
  @override
  Future<Either<BrandsResponse,String>> getBrands() async {
    try {
      var response =
          await apiManager.getRequest(endpoints: EndPoints.brandsEndpoints);
      BrandsResponse brandsResponse = BrandsResponse.fromJson(response.data);
      return Left(brandsResponse);
    } catch (error) {
      return Right(error.toString());
    }
  }
}
