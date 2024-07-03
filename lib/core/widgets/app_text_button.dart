import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_market/core/utils/colors.dart';

import '../utils/styles.dart';

class AppTextButton extends StatelessWidget {
  const AppTextButton({
    super.key,
    this.onPressed,
    required this.text,
    this.backgroundColor,
    // this.textColor,
    this.width,
    this.height,
    this.textStyle, this.borderRadius,
  });
  final void Function()? onPressed;
  final String text;
  final Color? backgroundColor;
  // final Color? textColor;
  final double? width, height;
  final TextStyle? textStyle;
  final BorderRadiusGeometry? borderRadius;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        backgroundColor: backgroundColor ?? ColorManager.green69,
        minimumSize: Size(width ?? 146.w, height ?? 48.h),
        shape: RoundedRectangleBorder(
          borderRadius:borderRadius?? BorderRadius.circular(5.r),
        ),
      ),
      child: Text(
        text,
        style: textStyle ??
            Styles.font14Medium.copyWith(
              color: Colors.white,
            ),
      ),
    );
  }
}
