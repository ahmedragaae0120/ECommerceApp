import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:ecommerceapp/Data/data_source_contract/remote/subCategories_datasource.dart';
import 'package:ecommerceapp/Data/models/subcategories_response/SubCategoriesResponse.dart';
import 'package:ecommerceapp/core/api/api_manager.dart';
import 'package:ecommerceapp/core/api/endpoints.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: SubCategoriesDatasource)
class SubCategoriesDatasourceImpl extends SubCategoriesDatasource {
  ApiManager apiManager;
  @factoryMethod
  SubCategoriesDatasourceImpl(this.apiManager);
  @override
  Future<Either<SubCategoriesResponse, String>> getSubCategoriesSpecific(
      String categoryId) async {
    try {
      var response = await apiManager.getRequest(
          endpoints: EndPoints.subCategoriesEndpoints(categoryId));
      SubCategoriesResponse subcategoriesresponse = SubCategoriesResponse.fromJson(response.data);
      print("SubCategoriesDatasourceImpl: $subcategoriesresponse");
      return Left(subcategoriesresponse);
    } catch (error) {
      return Right(error.toString());
    }
  }
}
