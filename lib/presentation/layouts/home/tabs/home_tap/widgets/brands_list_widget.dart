import 'package:ecommerceapp/presentation/layouts/home/tabs/home_tap/view_model/home_tap_view_model_cubit.dart';
import 'package:ecommerceapp/presentation/layouts/home/tabs/home_tap/widgets/brands_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

class BrandsListWidget extends StatefulWidget {
  const BrandsListWidget({super.key});

  @override
  State<BrandsListWidget> createState() => _BrandsListWidgetState();
}

class _BrandsListWidgetState extends State<BrandsListWidget> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<HomeTapViewModelCubit>().getBrands();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeTapViewModelCubit, HomeTapViewModelState>(
      buildWhen: (previous, current) {
        if (current is BrandsSuccessState) {
          return true;
        }
        return false;
      },
      listenWhen: (previous, current) {
        if (current is BrandsSuccessState ||
            current is BrandsLoadingState ||
            current is BrandsErrorState) {
          return true;
        }
        return false;
      },
      listener: (context, state) {
        if (state is HomeTapErrorState) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              content: Text(state.error),
            ),
          );
        }
        if (state is HomeTapLoadingState) {
          showDialog(
            context: context,
            builder: (context) => const AlertDialog(
              content: CircularProgressIndicator.adaptive(),
            ),
          );
        }
        if (state is HomeTapSuccessState) {
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        if (state is BrandsSuccessState) {
          return SliverToBoxAdapter(
            child: SizedBox(
              height: 100.h,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) => BrandsWidget(
                        brand: state.brands[index],
                      ),
                  separatorBuilder: (context, index) => SizedBox(width: 10.w),
                  itemCount: state.brands.length),
            ),
          );
        }
        return const SliverToBoxAdapter(
            child: Center(
          child: CircularProgressIndicator(),
        ));
      },
    );
  }
}
