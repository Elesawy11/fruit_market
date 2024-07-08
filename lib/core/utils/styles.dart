import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_market/core/utils/font_weight_helper.dart';

abstract class Styles {
  static TextStyle font12Regular = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeightHelper.regular,
  );
  static TextStyle font14Regular = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.regular,
  );
  static TextStyle font14Medium = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.medium,
  );
  static TextStyle font15Regular = TextStyle(
    fontSize: 15.sp,
    fontWeight: FontWeightHelper.regular,
  );
  static TextStyle font16SemiBold = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.semiBold,
  );
  static TextStyle font20SemiBold = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeightHelper.semiBold,
  );
  static TextStyle font42Bold = TextStyle(
    fontSize: 42.sp,
    fontWeight: FontWeightHelper.bold,
  );
}
