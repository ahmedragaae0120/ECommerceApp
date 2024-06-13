import 'package:ecommerceapp/core/reusable%20components/product_widget.dart';
import 'package:ecommerceapp/presentation/layouts/home/tabs/home_tap/view_model/home_tap_view_model_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MostSellingProductsListWidget extends StatefulWidget {
  const MostSellingProductsListWidget({super.key});

  @override
  State<MostSellingProductsListWidget> createState() =>
      _MostSellingProductsListWidgetState();
}

class _MostSellingProductsListWidgetState
    extends State<MostSellingProductsListWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<HomeTapViewModelCubit>().getProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeTapViewModelCubit, HomeTapViewModelState>(
      buildWhen: (prevState, currentState) {
        if (currentState is ProductSuccessState) {
          return true;
        }
        return false;
      },
      listenWhen: (previous, current) {
        if (current is ProductSuccessState ||
            current is ProductErrorState ||
            current is ProductLoadingState) {
          return true;
        }
        return false;
      },
      builder: (context, state) {
        if (state is ProductSuccessState) {
          return SliverToBoxAdapter(
            child: SizedBox(
              height: 237.h,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) =>
                    ProductWidget(product: state.Products[index]),
                separatorBuilder: (context, index) => const SizedBox(width: 10),
                itemCount: state.Products.length,
              ),
            ),
          );
        }
        return const SliverToBoxAdapter(
            child: Center(
          child: CircularProgressIndicator(),
        ));
      },
      listener: (context, state) {
        if (state is ProductSuccessState) {
          Navigator.pop(context);
        }
        if (state is ProductErrorState) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              content: Text(state.error),
            ),
          );
        }
        if (state is ProductLoadingState) {
          showDialog(
            context: context,
            builder: (context) => const AlertDialog(
              content: Center(child: CircularProgressIndicator.adaptive()),
            ),
          );
        }
      },
    );
  }
}
