import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_market/core/utils/colors.dart';
import 'package:fruit_market/core/utils/spacer.dart';
import 'package:fruit_market/core/utils/styles.dart';
import 'package:fruit_market/features/home/data/models/product_details.dart';
import 'package:go_router/go_router.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({
    super.key,
    required this.product,
    // required this.image,
    // required this.name,
    // required this.price,
    // required this.rate,
  });
  // final String image, name, price;
  // final double rate;
  final ProductDetails product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            // verticalSpace(20),
            Container(
              decoration: const BoxDecoration(color: ColorManager.green69),
              width: double.infinity,
              child: Row(
                children: [
                  IconButton(
                      onPressed: () => context.pop(),
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      )),
                  Text(
                    'DETAILS',
                    style: Styles.font14Medium.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              child: Image.network(
                product.image,
                width: 335.w,
                height: 176.h,
                fit: BoxFit.fill,
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
