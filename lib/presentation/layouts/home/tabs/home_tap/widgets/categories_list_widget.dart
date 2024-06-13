import 'package:ecommerceapp/presentation/layouts/home/tabs/home_tap/view_model/home_tap_view_model_cubit.dart';
import 'package:ecommerceapp/presentation/layouts/home/tabs/home_tap/widgets/categories_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CaetegoriesListWidget extends StatefulWidget {
  const CaetegoriesListWidget({super.key});

  @override
  State<CaetegoriesListWidget> createState() => _CaetegoriesListWidgetState();
}

class _CaetegoriesListWidgetState extends State<CaetegoriesListWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<HomeTapViewModelCubit>().getCategories();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeTapViewModelCubit, HomeTapViewModelState>(
      buildWhen: (prevState, currentState) {
        if (currentState is HomeTapSuccessState) {
          return true;
        }
        return false;
      },
      listenWhen: (previous, current) {
        if (current is HomeTapSuccessState ||
            current is HomeTapErrorState ||
            current is HomeTapLoadingState) {
          return true;
        }
        return false;
      },
      builder: (context, state) {
        if (state is HomeTapSuccessState) {
          return SliverToBoxAdapter(
            child: SizedBox(
              height: 288,
              child: GridView.builder(
                scrollDirection: Axis.horizontal,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 5,
                ),
                itemBuilder: (context, index) =>
                    CategoriesWidget(categorie: state.Categories[index]),
                itemCount: state.Categories.length,
              ),
            ),
          );
        }
        return SliverToBoxAdapter(
            child: Center(
          child: CircularProgressIndicator(),
        ));
      },
      listener: (context, state) {
        if (state is HomeTapSuccessState) {
          Navigator.pop(context);
        }
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
            builder: (context) => AlertDialog(
              content: Center(child: CircularProgressIndicator.adaptive()),
            ),
          );
        }
      },
    );
  }
}
