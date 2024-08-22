import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_market/core/utils/colors.dart';
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
        appBar: AppBar(
          backgroundColor: ColorManager.green69,
          automaticallyImplyLeading: true,
          toolbarHeight: 100.h,
          leading: IconButton(
            onPressed: () => context.pop(),
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
          title: Text(
            'DETAILS',
            style: Styles.font14Medium.copyWith(
              color: Colors.white,
            ),
          ),
        ),
        body: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
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
        ));
  }
}
