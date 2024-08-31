import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_market/core/utils/routes.dart';
import 'package:fruit_market/features/home/data/models/product_details.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/spacer.dart';
import '../../../../../core/utils/styles.dart';
import 'custom_rating_bar.dart';

class CustomProductWidget extends StatefulWidget {
  const CustomProductWidget({
    super.key,
    required this.product,
  });

  final ProductDetails product;

  @override
  State<CustomProductWidget> createState() => _CustomProductWidgetState();
}

class _CustomProductWidgetState extends State<CustomProductWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              GestureDetector(
                onTap: () {
                  context.go(
                    Routes.detailsView,
                    extra: widget.product,
                  );
                },
                child: Image.network(
                  widget.product.image,
                  width: 118.w,
                  height: 143.h,
                ),
              ),

              // Icon Widget

              Positioned(
                right: 8,
                top: 8,
                child: GestureDetector(
                  onTap: () {
                    widget.product.isFavorite = !widget.product.isFavorite;
                    setState(() {});
                  },
                  child: Container(
                    height: 28.h,
                    width: 28.w,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                    child: widget.product.isFavorite
                        ? Icon(
                            Icons.favorite,
                            size: 18.r,
                            color: Colors.red,
                          )
                        : Icon(
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
          CustomRatingBar(product: widget.product),
          verticalSpace(5),
          Text(
            widget.product.name,
            style: Styles.font14SemiBold,
          ),
          verticalSpace(5),
          Text(
            '${widget.product.price}\$ Per/ kg',
            style: Styles.font12Regular,
          )
        ],
      ),
    );
  }
}
