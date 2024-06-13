import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerceapp/core/Di/di.dart';
import 'package:ecommerceapp/core/utils/assets_manager.dart';
import 'package:ecommerceapp/core/utils/strings_manager.dart';
import 'package:ecommerceapp/presentation/layouts/home/tabs/home_tap/view_model/home_tap_view_model_cubit.dart';
import 'package:ecommerceapp/presentation/layouts/home/tabs/home_tap/widgets/brands_list_widget.dart';
import 'package:ecommerceapp/presentation/layouts/home/tabs/home_tap/widgets/categories_list_widget.dart';
import 'package:ecommerceapp/presentation/layouts/home/tabs/home_tap/widgets/most_selling_products_list_widget.dart';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeTap extends StatelessWidget {
  const HomeTap({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<HomeTapViewModelCubit>(),
      child: Padding(
        padding: REdgeInsets.only(left: 15, right: 15),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: CarouselSlider.builder(
                  itemCount: AssetsManager.sliderImages.length,
                  itemBuilder: (context, index, realIndex) =>
                      Image.asset(AssetsManager.sliderImages[index]),
                  options: CarouselOptions(
                    autoPlay: true,
                    autoPlayAnimationDuration: const Duration(seconds: 2),
                    scrollPhysics: const BouncingScrollPhysics(),
                    viewportFraction: 1.1,
                  )),
            ),
            SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    StringsManager.categories,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  Text(
                    StringsManager.viewAll,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontSize: 12, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 16)),
            const CaetegoriesListWidget(),
            SliverToBoxAdapter(
              child: Text(
                StringsManager.homeAppliance,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            const BrandsListWidget(),
            SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    StringsManager.mostSelling,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  Text(
                    StringsManager.viewAll,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontSize: 12, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 16)),
            const MostSellingProductsListWidget(),
            const SliverToBoxAdapter(child: SizedBox(height: 16)),
          ],
        ),
      ),
    );
  }
}
