import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/spacer.dart';
import '../../../../../core/utils/styles.dart';

class CustomProductWidget extends StatelessWidget {
  const CustomProductWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Image.asset(
                Assets.assetsImagesFruit1,
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
            minRating: 1,
            maxRating: 5,
            initialRating: 0,
            itemSize: 16.r,
            itemPadding: EdgeInsets.only(left: 4.w),
            // ignoreGestures: true,
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
            'Strawberry',
            style: Styles.font14SemiBold,
          ),
          verticalSpace(5),
          Text(
            '300\$ Per/ kg',
            style: Styles.font12Regular,
          )
        ],
      ),
    );
  }
}
