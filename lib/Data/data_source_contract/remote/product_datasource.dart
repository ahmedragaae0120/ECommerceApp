import 'package:dartz/dartz.dart';
import 'package:ecommerceapp/Data/models/product_response/ProductResponse.dart';

abstract class ProductDatasource {
  Future<Either<ProductResponse,String>> getProduct({String? sort ="", String? subcategoryid= ""});
}
enum SortingProducts {
  mostSelling("-sold"),
  leastSelling("sold"),
  highestRated("-ratingsAverage"),
  lowestRated("ratingsAverage"),
  descendingPrice("-price"),
  ascendingPrice("price");

  final String sort;
  const SortingProducts(this.sort);
}