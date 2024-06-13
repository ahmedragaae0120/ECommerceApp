import 'dart:developer';

import 'package:ecommerceapp/core/Di/di.dart';
import 'package:ecommerceapp/core/reusable%20components/product_widget.dart';
import 'package:ecommerceapp/core/utils/strings_manager.dart';
import 'package:ecommerceapp/presentation/layouts/home/tabs/categories_tap/view_model/categories_tap_viewmodel_cubit.dart';
import 'package:ecommerceapp/presentation/layouts/home/tabs/categories_tap/widgets/categories_selection_widget.dart';
import 'package:ecommerceapp/presentation/layouts/home/tabs/categories_tap/widgets/sub_categories_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesTap extends StatefulWidget {
  const CategoriesTap({super.key});

  @override
  State<CategoriesTap> createState() => _CategoriesTapState();
}

class _CategoriesTapState extends State<CategoriesTap> {
  int selectedIndex = 0;
  late String selectedSubcategoryId;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (context) => getIt<CategoriesTapViewmodel>()..getCategories(),
      child: BlocConsumer<CategoriesTapViewmodel, CategoriesTapViewmodelState>(
        listener: (context, state) {
          if (state is CategoriesSuccessState) {
            // log(state.categorieEntity[selectedIndex].id ?? "");
            context.read<CategoriesTapViewmodel>().getSubCategoriesSpecific(
                state.categorieEntity[selectedIndex].id ?? "");
          }
        },
        buildWhen: (previous, current) {
          if (current is CategoriesSuccessState ||
              current is CategoriesLoadingState ||
              current is CategoriesErrorState) {
            return true;
          }
          return false;
        },
        builder: (context, state) {
          if (state is CategoriesSuccessState) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 170.w,
                  height: height * 0.78.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.r),
                        bottomLeft: Radius.circular(10.r)),
                    color: const Color(0xffdbe4ed).withOpacity(0.5),
                  ),
                  child: ListView.separated(
                      itemBuilder: (context, index) =>
                          CategoriesSelectionWidget(
                            selectedCategorie: () {
                              selectedIndex = index;
                              setState(() {});
                              CategoriesTapViewmodel.get(context)
                                  .getSubCategoriesSpecific(
                                      state.categorieEntity[selectedIndex].id ??
                                          "");
                              log(state.categorieEntity[selectedIndex].id ??
                                  "");
                            },
                            categorieEntity: state.categorieEntity[index],
                            isSelected: index == selectedIndex,
                          ),
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 5.h),
                      itemCount: state.categorieEntity.length),
                ),
                Expanded(
                  child: BlocBuilder<CategoriesTapViewmodel,
                      CategoriesTapViewmodelState>(
                    buildWhen: (previous, current) {
                      if (current is SubCategoriesSpecificErrorState ||
                          current is SubCategoriesSpecificLoadingState ||
                          current is SubCategoriesSpecificSuccessState) {
                        return true;
                      }
                      return false;
                    },
                    builder: (context, state) {
                      if (state is SubCategoriesSpecificSuccessState) {
                        return state.subcategorieEntity.isEmpty
                            ? const Center(
                                child: Text(StringsManager.notFoundCategory))
                            : Padding(
                                padding: REdgeInsets.only(left: 10),
                                child: GridView.builder(
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          childAspectRatio: 0.9,
                                          crossAxisSpacing: 5.w,
                                          mainAxisSpacing: 2.h),
                                  itemBuilder: (context, index) => InkWell(
                                    onTap: () {
                                      log(state.subcategorieEntity[index].id ??
                                          "");
                                      selectedSubcategoryId =
                                          state.subcategorieEntity[index].id ??
                                              "";
                                      CategoriesTapViewmodel.get(context)
                                          .getProductsInSubcategory(state
                                                  .subcategorieEntity[index]
                                                  .id ??
                                              "");
                                      BlocConsumer<CategoriesTapViewmodel,
                                          CategoriesTapViewmodelState>(
                                        buildWhen: (previous, current) {
                                          if (current is ProductsInSubcategorySuccessState ||
                                              current
                                                  is ProductsInSubcategoryLoadingState ||
                                              current
                                                  is ProductsInSubcategoryErrorState) {
                                            return true;
                                          }
                                          return false;
                                        },
                                        listener: (context, state) {
                                          if (state
                                              is ProductsInSubcategorySuccessState) {
                                            // log(state.categorieEntity[selectedIndex].id ?? "");
                                            context
                                                .read<CategoriesTapViewmodel>()
                                                .getProductsInSubcategory(
                                                    selectedSubcategoryId ??
                                                        "");
                                          }
                                        },
                                        builder: (context, state) {
                                          if (state
                                              is ProductsInSubcategorySuccessState) {
                                            return GridView.builder(
                                              gridDelegate:
                                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                                      crossAxisCount: 2),
                                              itemBuilder: (context, index) =>
                                                  ProductWidget(
                                                      product: state
                                                          .products[index]),
                                              itemCount: state.products.length,
                                            );
                                          }
                                          if (state
                                              is ProductsInSubcategoryErrorState) {
                                            return Text(state.error);
                                          }
                                          return const Center(
                                            child: CircularProgressIndicator
                                                .adaptive(),
                                          );
                                        },
                                      );
                                    },
                                    child: SubCategoriesWidget(
                                        subcategoryEntity:
                                            state.subcategorieEntity[index]),
                                  ),
                                  itemCount: state.subcategorieEntity.length,
                                ),
                              );
                      }
                      if (state is SubCategoriesSpecificErrorState) {
                        return Center(
                          child: Text(state.error),
                        );
                      }
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  ),
                ),
              ],
            );
          }
          if (state is CategoriesErrorState) {
            return Center(
              child: Text(
                state.error,
              ),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
