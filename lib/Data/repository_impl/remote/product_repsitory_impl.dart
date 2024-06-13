import 'package:dartz/dartz.dart';
import 'package:ecommerceapp/Data/data_source_contract/remote/product_datasource.dart';
import 'package:ecommerceapp/Data/models/product_response/productModel.dart';
import 'package:ecommerceapp/Domain/entities/ProductEntity.dart';
import 'package:ecommerceapp/Domain/repository_contract/product_repsitory.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProductRepo)
class ProductRepsitoryImpl extends ProductRepo {
  ProductDatasource apiDatasource;
  @factoryMethod
  ProductRepsitoryImpl(this.apiDatasource);
  @override
  Future<Either<List<ProductEntity> , String>> getProduct({String? sort = "", String? subcategoryid = ""}) async {
    var result = await apiDatasource.getProduct(sort: sort,subcategoryid: subcategoryid);
    return result.fold((response) {
      List<ProductModel> productModelList = response.data ?? [];
      List<ProductEntity> productEntityList =
          productModelList.map((product) => product.toProductEntity()).toList();
      print(productEntityList);
      return Left(productEntityList);
    }, (error) {
      return Right(error);
    });
  }
}
