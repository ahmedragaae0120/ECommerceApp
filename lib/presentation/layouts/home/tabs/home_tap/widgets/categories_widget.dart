import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerceapp/Domain/entities/CategorieEntity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesWidget extends StatelessWidget {
  final CategorieEntity categorie;
  const CategoriesWidget({super.key, required this.categorie});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CachedNetworkImage(
          imageUrl: categorie.image ?? "",
          errorWidget: (context, url, error) => Icon(Icons.error,size: 25.sp),
          placeholder: (context, url) => Center(child: CircularProgressIndicator(),),
          imageBuilder: (context, imageProvider) {
            return CircleAvatar(
              radius: 45.r,
              backgroundImage: imageProvider,
            );
          },
        ),
        SizedBox(
          height: 5.h,
        ),
        Text(
          categorie.name ?? "",
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(fontSize: 14.sp, fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}
