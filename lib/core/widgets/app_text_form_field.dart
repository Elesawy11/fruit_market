import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_market/core/utils/colors.dart';
import 'package:fruit_market/core/utils/font_weight_helper.dart';
import '../utils/styles.dart';

class AppTextFormField extends StatelessWidget {
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? inputTextStyle;
  final TextStyle? hintStyle;
  final String hintText;
  final bool? isObscureText;
  final Widget? suffixIcon;
  final Color? backgroundColor;
  final TextEditingController? controller;
  final Function(String?) validator;
  final Widget? prefixIcon;
  final int? maxLines;
  final double? radius;
  final void Function()? onTap;
  final void Function(PointerDownEvent)? onTapOutside;
  const AppTextFormField({
    super.key,
    this.contentPadding,
    this.focusedBorder,
    this.enabledBorder,
    this.inputTextStyle,
    this.hintStyle,
    required this.hintText,
    this.isObscureText,
    this.suffixIcon,
    this.backgroundColor,
    this.controller,
    required this.validator,
    this.prefixIcon,
    this.maxLines = 1,
    this.onTap,
    this.onTapOutside,
    this.radius,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTapOutside: onTapOutside,
      onTap: onTap,
     
      controller: controller,
      maxLines: maxLines,
      decoration: InputDecoration(
        isDense: true,
        contentPadding: contentPadding ??
            EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
        focusedBorder: focusedBorder ??
            outLineBorder(
              color: ColorManager.greyCC,
              radius: radius,
            ),
        enabledBorder: enabledBorder ??
            outLineBorder(
              color: ColorManager.greyCC,
              radius: radius,
            ),
        errorBorder: outLineBorder(
          color: Colors.red,
          radius: radius,
        ),
        focusedErrorBorder: outLineBorder(
          color: Colors.red,
          radius: radius,
        ),
        hintStyle: hintStyle ??
            Styles.font14Regular.copyWith(
              color: ColorManager.grey70,
            ),
        hintText: hintText,
        suffixIcon: suffixIcon,
        fillColor: backgroundColor ?? Theme.of(context).canvasColor,
        filled: true,
        prefixIcon: prefixIcon,
      ),
      obscureText: isObscureText ?? false,
      style: Styles.font14Regular.copyWith(
        fontWeight: FontWeightHelper.medium,
        color: ColorManager.grey78,
      ),
      validator: (value) {
        return validator(value);
      },
    );
  }

  OutlineInputBorder outLineBorder({required Color color, double? radius}) {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: color,
        width: 1.3,
      ),
      borderRadius: BorderRadius.circular(radius ?? 16.0.r),
    );
  }
}
