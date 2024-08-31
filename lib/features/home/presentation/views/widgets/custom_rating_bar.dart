import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/colors.dart';
import '../../../data/models/product_details.dart';

class CustomRatingBar extends StatelessWidget {
  const CustomRatingBar({
    super.key,
    required this.product,
  });

  final ProductDetails product;

  @override
  Widget build(BuildContext context) {
    return RatingBar(
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
    );
  }
}
