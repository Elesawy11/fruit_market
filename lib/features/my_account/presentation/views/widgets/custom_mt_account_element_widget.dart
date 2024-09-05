import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/spacer.dart';
import '../../../../../core/utils/styles.dart';

class CustomMyAccountElementWidget extends StatelessWidget {
  const CustomMyAccountElementWidget({
    super.key,
    required this.icon,
    required this.text,
  });
  final IconData icon;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 68.h,
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: ColorManager.greyD1,
          ),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 26.w),
        child: Row(
          children: [
            Icon(
              icon,
              color: ColorManager.green69,
              size: 26.r,
            ),
            horizontalSpace(18),
            Text(
              text,
              style: Styles.font14Medium,
            ),
          ],
        ),
      ),
    );
  }
}
