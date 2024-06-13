import 'package:ecommerceapp/core/utils/assets_manager.dart';
import 'package:ecommerceapp/presentation/layouts/home/home_view_model.dart';
import 'package:ecommerceapp/presentation/layouts/home/tabs/categories_tap/categories_tap.dart';
import 'package:ecommerceapp/presentation/layouts/home/tabs/home_tap/home_tap.dart';
import 'package:ecommerceapp/presentation/layouts/home/widgets/search_%20bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> tabs = [const HomeTap(), const CategoriesTap()];
    return BlocBuilder<HomeViewmodel, HomeStates>(
      builder: (BuildContext context, HomeStates state) {
        HomeViewmodel homeViewmodel = HomeViewmodel.get(context);
        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  AssetsManager.routeLogo,
                ),
                SizedBox(height: 19.h),
                Row(
                  children: [
                    const Expanded(child: SearchBarWidget()),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.shopping_cart_outlined,
                          size: 30.sp,
                          color: Theme.of(context).colorScheme.primary,
                        )),
                  ],
                ),
              ],
            ),
          ),
          bottomNavigationBar: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.r),
              topRight: Radius.circular(20.r),
            ),
            child: BottomNavigationBar(
              currentIndex: homeViewmodel.currenteTapIndex,
              onTap: (newIndex) {
                homeViewmodel.changeBottomNavTap(newIndex);
              },
              type: BottomNavigationBarType.fixed,
              backgroundColor: Theme.of(context).colorScheme.primary,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              elevation: 10,
              items: [
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    AssetsManager.home,
                    height: 32.h,
                    width: 32.w,
                  ),
                  activeIcon: SvgPicture.asset(
                    AssetsManager.homeSelected,
                    height: 32.h,
                    width: 32.w,
                  ),
                  label: '',
                  backgroundColor: Theme.of(context).colorScheme.primary,
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    AssetsManager.categories,
                    height: 32.h,
                    width: 32.w,
                  ),
                  activeIcon: SvgPicture.asset(
                    AssetsManager.categoriesSelected,
                    height: 32.h,
                    width: 32.w,
                  ),
                  label: '',
                  backgroundColor: Theme.of(context).colorScheme.primary,
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    AssetsManager.whishlist,
                    height: 32.h,
                    width: 32.w,
                  ),
                  activeIcon: SvgPicture.asset(
                    AssetsManager.whishlistSelected,
                    height: 32.h,
                    width: 32.w,
                  ),
                  label: '',
                  backgroundColor: Theme.of(context).colorScheme.primary,
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    AssetsManager.profile,
                    height: 32.h,
                    width: 32.w,
                  ),
                  activeIcon: SvgPicture.asset(
                    AssetsManager.profileSelected,
                    height: 32.h,
                    width: 32.w,
                  ),
                  label: '',
                  backgroundColor: Theme.of(context).colorScheme.primary,
                ),
              ],
            ),
          ),
          body: tabs[homeViewmodel.currenteTapIndex],
        );
      },
    );
  }
}
