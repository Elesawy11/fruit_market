import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/widgets/app_text_form_field.dart';

class HomeViewBar extends StatelessWidget {
  const HomeViewBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          color: ColorManager.green69,
          height: 114.h,
          width: MediaQuery.of(context).size.width,
        ),
        Positioned(
          width: MediaQuery.of(context).size.width,
          top: 0,
          bottom: 0,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    Assets.assetsImagesFruitMarket,
                    height: 36.h,
                    width: 116.w,
                  ),
                  const Icon(
                    Icons.notifications,
                    color: Colors.white,
                  )
                ],
              ),
            ),
          ),
        ),
        Positioned(
          width: MediaQuery.of(context).size.width,
          bottom: -20,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Container(
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: ColorManager.grey89,
                    blurRadius: 1,
                    spreadRadius: 1,
                  )
                ],
              ),
              width: 335.w,
              height: 40.h,
              child: AppTextFormField(
                hintText: 'Search',
                validator: (p0) {},
                radius: 6,
                prefixIcon: Icon(
                  Icons.search,
                  color: ColorManager.grey70,
                  size: 14.r,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
