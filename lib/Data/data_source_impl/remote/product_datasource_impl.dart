import 'package:dartz/dartz.dart';
import 'package:ecommerceapp/Data/data_source_contract/remote/product_datasource.dart';
import 'package:ecommerceapp/Data/models/product_response/ProductResponse.dart';
import 'package:ecommerceapp/core/api/api_manager.dart';
import 'package:ecommerceapp/core/api/endpoints.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProductDatasource)
class ProductDatasourceImpl extends ProductDatasource {
  ApiManager apiManager;
  @factoryMethod
  ProductDatasourceImpl(this.apiManager);

  @override
  Future<Either<ProductResponse, String>> getProduct(
      {String? sort = "", String? subcategoryid = ""}) async {
    try {
      var response = await apiManager.getRequest(
          endpoints: EndPoints.productsEndpoints,
          queryParameters: {"sort": sort, "category": subcategoryid});
      ProductResponse productResponse = ProductResponse.fromJson(response.data);
      // print(productResponse ?? "");
      return Left(productResponse);
    } catch (error) {
      return Right(error.toString());
    }
  }
}
