// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../Data/data_source_contract/remote/brands_datasource.dart' as _i15;
import '../../Data/data_source_contract/remote/categories_datasource.dart'
    as _i8;
import '../../Data/data_source_contract/remote/product_datasource.dart' as _i4;
import '../../Data/data_source_contract/remote/subCategories_datasource.dart'
    as _i6;
import '../../Data/data_source_impl/remote/brands_datasource_impl.dart' as _i16;
import '../../Data/data_source_impl/remote/categories_datasource_impl.dart'
    as _i9;
import '../../Data/data_source_impl/remote/product_datasource_impl.dart' as _i5;
import '../../Data/data_source_impl/remote/subCategories_datasource_impl.dart'
    as _i7;
import '../../Data/repository_impl/remote/brands_repository_impl.dart' as _i24;
import '../../Data/repository_impl/remote/categories_repository_impl.dart'
    as _i11;
import '../../Data/repository_impl/remote/product_repsitory_impl.dart' as _i19;
import '../../Data/repository_impl/remote/subCategories_repository_impl.dart'
    as _i14;
import '../../Domain/repository_contract/brands_repository.dart' as _i23;
import '../../Domain/repository_contract/categories_repository.dart' as _i10;
import '../../Domain/repository_contract/product_repsitory.dart' as _i18;
import '../../Domain/repository_contract/subCategories_repository.dart' as _i13;
import '../../Domain/use_cases/brands_usecase.dart' as _i26;
import '../../Domain/use_cases/categories_usecase.dart' as _i12;
import '../../Domain/use_cases/getProductsInSubcategory_usecase.dart' as _i22;
import '../../Domain/use_cases/getSubCategoriesSpecific_usecase.dart' as _i17;
import '../../Domain/use_cases/most_selling_product_usecase.dart' as _i20;
import '../../Domain/use_cases/product_usecase.dart' as _i21;
import '../../presentation/layouts/home/tabs/categories_tap/view_model/categories_tap_viewmodel_cubit.dart'
    as _i25;
import '../../presentation/layouts/home/tabs/home_tap/view_model/home_tap_view_model_cubit.dart'
    as _i27;
import '../api/api_manager.dart' as _i3;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i3.ApiManager>(() => _i3.ApiManager());
    gh.factory<_i4.ProductDatasource>(
        () => _i5.ProductDatasourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i6.SubCategoriesDatasource>(
        () => _i7.SubCategoriesDatasourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i8.CategoriesDatasource>(
        () => _i9.CategoriesDatasourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i10.CategoriesRepo>(
        () => _i11.CategoriesRepositoryImpl(gh<_i8.CategoriesDatasource>()));
    gh.factory<_i12.CategoriesUsecase>(
        () => _i12.CategoriesUsecase(gh<_i10.CategoriesRepo>()));
    gh.factory<_i13.SubCategoriesRepository>(() =>
        _i14.SubCategoriesRepositoryImpl(gh<_i6.SubCategoriesDatasource>()));
    gh.factory<_i15.BrandsDatasource>(
        () => _i16.BrandsDatasourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i17.GetSubCategoriesSpecificUsecase>(() =>
        _i17.GetSubCategoriesSpecificUsecase(
            gh<_i13.SubCategoriesRepository>()));
    gh.factory<_i18.ProductRepo>(
        () => _i19.ProductRepsitoryImpl(gh<_i4.ProductDatasource>()));
    gh.factory<_i20.MostSellingProductUsecase>(
        () => _i20.MostSellingProductUsecase(gh<_i18.ProductRepo>()));
    gh.factory<_i21.ProductUsecase>(
        () => _i21.ProductUsecase(gh<_i18.ProductRepo>()));
    gh.factory<_i22.GetProductsInSubcategoryUsecase>(
        () => _i22.GetProductsInSubcategoryUsecase(gh<_i18.ProductRepo>()));
    gh.factory<_i23.BrandsRepository>(
        () => _i24.BrandsRepositoryImpl(gh<_i15.BrandsDatasource>()));
    gh.factory<_i25.CategoriesTapViewmodel>(() => _i25.CategoriesTapViewmodel(
          gh<_i12.CategoriesUsecase>(),
          gh<_i17.GetSubCategoriesSpecificUsecase>(),
          gh<_i22.GetProductsInSubcategoryUsecase>(),
        ));
    gh.factory<_i26.BrandsUsecase>(
        () => _i26.BrandsUsecase(gh<_i23.BrandsRepository>()));
    gh.factory<_i27.HomeTapViewModelCubit>(() => _i27.HomeTapViewModelCubit(
          gh<_i12.CategoriesUsecase>(),
          gh<_i26.BrandsUsecase>(),
          gh<_i21.ProductUsecase>(),
          gh<_i20.MostSellingProductUsecase>(),
        ));
    return this;
  }
}
