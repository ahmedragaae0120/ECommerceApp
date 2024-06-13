import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerceapp/Domain/entities/BrandsEntity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

class BrandsWidget extends StatelessWidget {
  final BrandsEntity brand;
  const BrandsWidget({super.key, required this.brand});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CachedNetworkImage(
          imageUrl: brand.image ?? "",
          errorWidget: (context, url, error) => Icon(Icons.error, size: 25.sp),
          placeholder: (context, url) => const Center(
            child: Skeletonizer(
              enabled: true,
              child: CircularProgressIndicator.adaptive(),
            ),
          ),
          imageBuilder: (context, imageProvider) {
            return Container(
              height: 100.h,
              width: 100.w,
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: imageProvider,
              )),
            );
          },
        ),
        // Text(
        //   brand.name ?? "",
        //   maxLines: 1,
        //   overflow: TextOverflow.ellipsis,
        //   style: Theme.of(context)
        //       .textTheme
        //       .bodyMedium!
        //       .copyWith(fontSize: 14.sp, fontWeight: FontWeight.w400),
        // ),
      ],
    );
  }
}
