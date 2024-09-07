import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_market/core/utils/routes.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/spacer.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../favorite/presentation/views/widgets/custom_Add_or_remove_button.dart';

class ShoppingCartElement extends StatelessWidget {
  const ShoppingCartElement({
    super.key,
  });

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
              child: Image.asset(
                'assets/images/login.png',
                fit: BoxFit.fill,
              ),
            ),
            horizontalSpace(20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Grapes',
                      style: Styles.font14SemiBold,
                    ),
                    horizontalSpace(90),
                    Text(
                      '160 Per/ kg',
                      style: Styles.font12SemiBold,
                    )
                  ],
                ),
                verticalSpace(2),
                Text(
                  'Pick up from organic farms',
                  style: Styles.font12Regular.copyWith(
                    color: ColorManager.greyB2,
                  ),
                ),
                verticalSpace(4),
                // CustomRatingBar(product: ),
                Row(
                  children: [
                    CustomAddOrRemoveButton(
                      icon: Icons.remove,
                      onTap: () {},
                    ),
                    horizontalSpace(10),
                    Text(
                      '0',
                      style: Styles.font15Regular,
                    ),
                    horizontalSpace(10),
                    CustomAddOrRemoveButton(
                      icon: Icons.add,
                      onTap: () {},
                    ),
                    horizontalSpace(60),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.delete,
                        // color: ColorManager.yellowCC,
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
                )
              ],
            ),
            // IconButton(
            //   padding: EdgeInsets.zero,
            //   onPressed: () {},
            //   icon: Icon(
            //     Icons.arrow_right_outlined,
            //     size: 32.r,
            //   ),
            // )
            Center(
              child: GestureDetector(
                // onTap: () => context.push(Routes.detailsView),
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
