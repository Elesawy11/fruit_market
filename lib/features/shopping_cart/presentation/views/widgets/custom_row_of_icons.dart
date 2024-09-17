import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/spacer.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../favorite/presentation/cubits/make_product_in_cart/make_product_in_cart_cubit.dart';
import '../../../../favorite/presentation/views/widgets/custom_Add_or_remove_button.dart';
import '../../../../home/data/models/product_details.dart';

class CustomRowOfIcons extends StatefulWidget {
  const CustomRowOfIcons({
    super.key,
    required this.product,
  });

  final ProductDetails product;

  @override
  State<CustomRowOfIcons> createState() => _CustomRowOfIconsState();
}

class _CustomRowOfIconsState extends State<CustomRowOfIcons> {
  int accounter = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomAddOrRemoveButton(
          icon: Icons.remove,
          onTap: () {
            if (accounter > 0) {
              accounter = accounter - 1;
            } else {
              accounter = 0;
            }

            setState(
              () {},
            );
          },
        ),
        horizontalSpace(10),
        Text(
          '$accounter',
          style: Styles.font15Regular,
        ),
        horizontalSpace(10),
        CustomAddOrRemoveButton(
          icon: Icons.add,
          onTap: () {
            setState(
              () {
                accounter = accounter + 1;
              },
            );
          },
        ),
        horizontalSpace(60),
        IconButton(
          onPressed: () {
            context
                .read<MakeProductInCartCubit>()
                .updateProductAndMakedFavorite(
                  firstCollection: widget.product.mainCollection,
                  collectionDoc: widget.product.department,
                  product: widget.product,
                );
          },
          icon: const Icon(
            Icons.delete,
            color: ColorManager.yellowCC,
          ),
        ),
        // GestureDetector(
        //   onTap: () {},
        //   child: Container(
        //     width: 68.w,
        //     height: 27.h,
        //     decoration: BoxDecoration(
        //         color: ColorManager.yellowCC,
        //         borderRadius: BorderRadius.circular(4)),
        //     child: Center(
        //       child: Text(
        //         'Add',
        //         style: Styles.font12Regular.copyWith(
        //           color: Colors.white,
        //         ),
        //       ),
        //     ),
        //   ),
        // )
      ],
    );
  }
}
