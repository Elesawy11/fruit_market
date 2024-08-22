import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_market/core/utils/routes.dart';
import 'package:fruit_market/features/home/data/models/product_details.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/spacer.dart';
import '../../../../../core/utils/styles.dart';

class CustomProductWidget extends StatelessWidget {
  const CustomProductWidget({
    super.key,
    required this.product,
  });

  final ProductDetails product;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.go(
          '${Routes.homeView}/${Routes.detailsView}',
          extra: product,
        );
      },
      child: Padding(
        padding: EdgeInsets.only(left: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.network(
                  product.image,
                  width: 118.w,
                  height: 143.h,
                ),

                // Icon Widget

                Positioned(
                  right: 8,
                  top: 8,
                  child: GestureDetector(
                    child: Container(
                      height: 28.h,
                      width: 28.w,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                      child: Icon(
                        Icons.favorite_border_outlined,
                        size: 18.r,
                        color: ColorManager.yellowED,
                      ),
                    ),
                  ),
                )
              ],
            ),
            verticalSpace(8),
            RatingBar(
              onRatingUpdate: (value) {},
              ignoreGestures: true,
              minRating: 1,
              maxRating: 5,
              initialRating: product.rate,
              itemSize: 16.r,
              itemPadding: EdgeInsets.only(left: 4.w),
              ratingWidget: RatingWidget(
                full: const Icon(
                  Icons.star,
                  color: ColorManager.yellowFF,
                ),
                half: const Icon(
                  Icons.star,
                  color: ColorManager.yellowFF,
                ),
                empty: const Icon(
                  Icons.star,
                  color: Colors.grey,
                ),
              ),
            ),
            verticalSpace(5),
            Text(
              product.name,
              style: Styles.font14SemiBold,
            ),
            verticalSpace(5),
            Text(
              '${product.price}\$ Per/ kg',
              style: Styles.font12Regular,
            )
          ],
        ),
      ),
    );
  }
}
