import 'package:ecommerceapp/Domain/entities/CategorieEntity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

typedef SelectedCategorie = void Function();

class CategoriesSelectionWidget extends StatelessWidget {
  final CategorieEntity categorieEntity;
  final bool isSelected;
  final SelectedCategorie selectedCategorie;
  const CategoriesSelectionWidget(
      {super.key,
      required this.categorieEntity,
      this.isSelected = false,
      required this.selectedCategorie});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        selectedCategorie();
      },
      child: Container(
        decoration: BoxDecoration(
            color: isSelected ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10.r),
              topLeft: Radius.circular(10.r),
            )),
        height: 100.h,
        width: 100.w,
        child: Row(
          children: [
            Visibility(
              visible: isSelected,
              child: VerticalDivider(
                thickness: 5,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            Text(categorieEntity.name ?? "",
                style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
      ),
    );
  }
}
