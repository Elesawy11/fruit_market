import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_market/features/home/data/models/product_details.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({
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
        body: Column(
      children: [
        Image.network(
          product.image,
          width: 335.w,
          height: 176.h,
        ),
      ],
    ));
  }
}
