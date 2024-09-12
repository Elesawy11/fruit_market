import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_market/core/utils/routes.dart';
import 'package:fruit_market/features/home/data/firebase/home_firebase.dart';
import 'package:fruit_market/features/home/data/models/product_details.dart';
import 'package:fruit_market/features/favorite/presentation/cubits/make_product_favorite/make_product_favorite_cubit.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/spacer.dart';
import '../../../../../core/utils/styles.dart';
import 'custom_rating_bar.dart';

class CustomProductWidget extends StatelessWidget {
  const CustomProductWidget({
    super.key,
    required this.product,
    required this.firstCollection,
    required this.collectionDoc,
  });

  final ProductDetails product;
  final String firstCollection, collectionDoc;
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
                    extra: product,
                  );
                },
                child: Image.network(
                  product.image,
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
                    context
                        .read<MakeProductFavoriteCubit>()
                        .updateProductAndMakedFavorite(
                          firstCollection: firstCollection,
                          collectionDoc: collectionDoc,
                          product: product,
                        );
                    // HomeFirebase().updateProduct(
                    //     firstCollection: firstCollection,
                    //     collectionDoc: collectionDoc,
                    //     docId: product.productId,
                    //     data: {
                    //       'isFavorite': !product.isFavorite,
                    //     });
    
                    // setState(() {});
                  },
                  child: Container(
                    height: 28.h,
                    width: 28.w,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                    child: product.isFavorite
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
              ),
              Positioned(
                left: 8,
                top: 8,
                child: GestureDetector(
                  onTap: () {
                    HomeFirebase().updateProduct(
                        firstCollection: firstCollection,
                        collectionDoc: collectionDoc,
                        docId: product.productId,
                        data: {
                          'isCartProduct': !product.isCartProduct,
                        });
                    // setState(() {});
                  },
                  child: Container(
                    height: 28.h,
                    width: 28.w,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                    child: product.isCartProduct
                        ? Icon(
                            Icons.shopping_cart,
                            size: 18.r,
                            color: ColorManager.yellowED,
                          )
                        : Icon(
                            Icons.add_shopping_cart,
                            size: 18.r,
                            color: ColorManager.grey83,
                          ),
                  ),
                ),
              )
            ],
          ),
          verticalSpace(8),
          CustomRatingBar(product: product),
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
    );
  }
}
