import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/spacer.dart';
import '../../../../../core/utils/styles.dart';

class CustomOrderProduct extends StatelessWidget {
  const CustomOrderProduct({
    super.key,
    // required this.product,
  });
  // final ProductDetails product;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 15.h),
      child: Container(
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(color: ColorManager.greyCC),
          ),
        ),
        width: double.infinity,
        height: MediaQuery.of(context).size.width * 0.27,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            horizontalSpace(20),
            SizedBox(
              height: 95.h,
              width: 95.w,
              child: Image.network(
                'https://firebasestorage.googleapis.com/v0/b/fruit-market-5bc73.appspot.com/o/dry%20fruit%2FDehiscent%20Dry%20Fruits%2Freal-fruit-pulp-aam-papad-231.png?alt=media&token=bd4e6724-2a5d-4923-a585-87e8d9f06ff4',
                fit: BoxFit.fill,
              ),
            ),
            horizontalSpace(20),
            SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        'product Named',
                        style: TextStyle(),
                      ),
                      horizontalSpace(90),
                    ],
                  ),
                  verticalSpace(2),
                  RatingBar(
                    onRatingUpdate: (value) {},
                    // ignoreGestures: true,
                    minRating: 0,
                    maxRating: 5,
                    initialRating: 0,
                    itemSize: 20.r,
                    tapOnlyMode: true,
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
                  Text(
                    'Rate this Product',
                    style: Styles.font12Regular.copyWith(
                      color: ColorManager.greyB2,
                    ),
                  ),
                  Text(
                    'Delivered on 24 Feb 2021.',
                    style: Styles.font14Regular.copyWith(
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
