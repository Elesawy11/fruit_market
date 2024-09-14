import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_market/features/favorite/presentation/cubits/make_product_favorite/make_product_favorite_cubit.dart';
import 'package:fruit_market/features/home/data/models/product_details.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/spacer.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../home/presentation/views/widgets/custom_rating_bar.dart';

class FavoriteViewElement extends StatelessWidget {
  const FavoriteViewElement({
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: Row(
                    children: [
                      Text(
                        product.name,
                        style: Styles.font14SemiBold,
                      ),
                      // horizontalSpace(40),
                      const Spacer(),
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
                verticalSpace(4),
                SizedBox(
                  height: 14.h,
                  child: FittedBox(
                    child: CustomRatingBar(
                      product: product,
                    ),
                  ),
                ),
                SizedBox(
                  height: 40.h,
                  child: FittedBox(
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.shopping_cart,
                            color: ColorManager.yellowCC,
                          ),
                        ),
                        horizontalSpace(60),
                        IconButton(
                          onPressed: () {
                            context
                                .read<MakeProductFavoriteCubit>()
                                .updateProductAndMakedFavorite(
                                  firstCollection: product.mainCollection,
                                  collectionDoc: product.department,
                                  product: product,
                                );
                          },
                          icon: const Icon(
                            Icons.favorite,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
