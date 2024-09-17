import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/spacer.dart';
import '../../../../../core/utils/styles.dart';

class DottedText extends StatelessWidget {
  const DottedText({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Row(
        children: [
          Container(
            height: 7.h,
            width: 7.w,
            decoration: BoxDecoration(
              color: ColorManager.grey83,
              borderRadius: BorderRadius.circular(10.r),
            ),
          ),
          horizontalSpace(13),
          Text(
            text,
            style: Styles.font12Regular,
          ),
        ],
      ),
    );
  }
}
