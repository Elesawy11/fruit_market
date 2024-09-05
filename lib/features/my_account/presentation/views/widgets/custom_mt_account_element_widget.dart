import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/spacer.dart';
import '../../../../../core/utils/styles.dart';

class CustomMyAccountElementWidget extends StatelessWidget {
  const CustomMyAccountElementWidget({
    super.key,
    required this.icon,
    required this.text,
    this.onTap,
  });
  final String icon;
  final String text;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
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
              SvgPicture.asset(
                icon,
              ),
              horizontalSpace(18),
              Text(
                text,
                style: Styles.font14Medium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
