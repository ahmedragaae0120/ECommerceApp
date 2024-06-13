import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerceapp/Domain/entities/ProductEntity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ProductWidget extends StatelessWidget {
  final ProductEntity product;
  const ProductWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 237.h,
      width: 190.w,
      decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
              width: 4)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15), topRight: Radius.circular(15)),
            child: CachedNetworkImage(
              imageUrl: product.imageCover ?? "",
              height: 128.h,
              width: double.infinity,
              errorWidget: (context, url, error) => const Icon(Icons.error),
              fit: BoxFit.fill,
              progressIndicatorBuilder: (context, url, progress) =>
                  const Center(child: CircularProgressIndicator.adaptive()),
            ),
          ),
          Text(
            product.title ?? "",
            maxLines: 1,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(fontSize: 14.sp, fontWeight: FontWeight.w400),
          ),
          Text(
            product.description ?? "",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(fontSize: 14.sp, fontWeight: FontWeight.w400),
          ),
          const SizedBox(height: 8),
          product.priceAfterDiscount == null
              ? Text(
                  "${product.price} EGP",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                      ),
                )
              : Row(
                  children: [
                    Text(
                      "EGP ${product.priceAfterDiscount}",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 14.sp, fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(width: 15),
                    Text(
                      "${product.price} EGP",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Theme.of(context)
                              .colorScheme
                              .primary
                              .withOpacity(0.6),
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          decoration: TextDecoration.lineThrough,
                          decorationColor: Theme.of(context)
                              .colorScheme
                              .primary
                              .withOpacity(0.6)),
                    ),
                  ],
                ),
          const SizedBox(height: 8),
          Row(
            children: [
              Text(
                "Review (${product.ratingsAverage})",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontSize: 12.sp, fontWeight: FontWeight.w400),
              ),
              SizedBox(
                width: 5.w,
              ),
              SvgPicture.asset("assets/images/Vector.svg"),
              const Spacer(),
              // FloatingActionButton(
              //   shape: const CircleBorder(),
              //   onPressed: () {},
              //   child: const Icon(Icons.add),
              // )
            ],
          )
        ],
      ),
    );
  }
}
