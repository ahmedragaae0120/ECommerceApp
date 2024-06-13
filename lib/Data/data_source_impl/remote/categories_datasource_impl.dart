import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:ecommerceapp/Data/data_source_contract/remote/categories_datasource.dart';
import 'package:ecommerceapp/Data/models/categorie_response/CategorieResponse.dart';
import 'package:ecommerceapp/core/api/api_manager.dart';
import 'package:ecommerceapp/core/api/endpoints.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CategoriesDatasource)
class CategoriesDatasourceImpl extends CategoriesDatasource {
  ApiManager apiManager;
  @factoryMethod
  CategoriesDatasourceImpl(this.apiManager);
  @override
  Future<Either<CategorieResponse, String>> get_categories() async {
    log("CategoriesDatasourceImpl");
    try {
      var response =
          await apiManager.getRequest(endpoints: EndPoints.categoriesEndpoints);
      CategorieResponse categorieResponse =
          CategorieResponse.fromJson(response.data);
      log("CategoriesDatasourceImpl");
      print(categorieResponse);
      return Left(categorieResponse);
    } catch (e) {
      log(e.toString());
      return Right(e.toString());
    }
  }
}
