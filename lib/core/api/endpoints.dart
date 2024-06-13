class EndPoints {
  static const String categoriesEndpoints = "/api/v1/categories";
  static const String brandsEndpoints = "/api/v1/brands";
  static const String productsEndpoints = "/api/v1/products";
  static String subCategoriesEndpoints(String categoryId) =>
      "/api/v1/categories/$categoryId/subcategories";
}
