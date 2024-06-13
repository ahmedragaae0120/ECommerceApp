import 'package:ecommerceapp/Domain/entities/SubcategoryEntity.dart';
import 'package:ecommerceapp/core/utils/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

@immutable
class SubCategoriesWidget extends StatelessWidget {
  SubcategoryEntity subcategoryEntity;
  SubCategoriesWidget({super.key, required this.subcategoryEntity});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.r),
              border: Border.all(color: const Color(0xff445866))),
          height: 80.h,
          width: 80.w,
          child: SvgPicture.asset(
            AssetsManager.subCategory,
            height: 200,
            width: 100,
            fit: BoxFit.fill,
            colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
          ),
        ),
        Text(
          subcategoryEntity.name ?? "",
          style: Theme.of(context).textTheme.bodySmall,
        )
      ],
    );
  }
}
