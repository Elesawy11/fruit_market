import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_market/features/home/data/models/product_details.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/routes.dart';
import '../../../../../core/utils/spacer.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../home/presentation/views/widgets/custom_rating_bar.dart';
import 'custom_row_of_icons.dart';

class ShoppingCartElement extends StatelessWidget {
  const ShoppingCartElement({
    super.key,
    required this.product,
  });
  final ProductDetails product;
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
                product.image,
                fit: BoxFit.fill,
              ),
            ),
            horizontalSpace(20),
            SizedBox(
              width: MediaQuery.of(context).size.width - (20 + 20 + 95 + 33).w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FittedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          product.name,
                          style: Styles.font14SemiBold,
                        ),
                        horizontalSpace(90),
                        Text(
                          '${product.price} Per/ kg',
                          style: Styles.font12SemiBold,
                        )
                      ],
                    ),
                  ),
                  verticalSpace(2),
                  Text(
                    'Pick up from organic farms',
                    style: Styles.font12Regular.copyWith(
                      color: ColorManager.greyB2,
                    ),
                  ),
                  CustomRatingBar(
                    product: product,
                  ),
                  CustomRowOfIcons(
                    product: product,
                  )
                ],
              ),
            ),
            Center(
              child: GestureDetector(
                onTap: () => context.push(
                  Routes.detailsView,
                  extra: product,
                ),
                child: Icon(
                  Icons.arrow_right_outlined,
                  size: 32.r,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
