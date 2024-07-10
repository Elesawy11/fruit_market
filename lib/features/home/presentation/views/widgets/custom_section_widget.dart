import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/spacer.dart';
import '../../../../../core/utils/styles.dart';
import 'custom_product_widget.dart';

class CustomSectionWidget extends StatelessWidget {
  const CustomSectionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Row(
            children: [
              Text(
                'Organic Fruits',
                style: Styles.font16SemiBold,
              ),
              horizontalSpace(10),
              Text(
                '(20% Off)',
                style: Styles.font12SemiBold.copyWith(
                  color: ColorManager.green4C,
                ),
              ),
            ],
          ),
        ),
        verticalSpace(5),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Text(
            'Pick up from organic farms',
            style: Styles.font12Regular,
          ),
        ),
        verticalSpace(16),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.30,
          child: ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: 6,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return const CustomProductWidget();
            },
          ),
        ),
      ],
    );
  }
}
