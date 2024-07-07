import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/styles.dart';

class LoginWithWidget extends StatelessWidget {
  const LoginWithWidget({
    super.key,
    required this.image,
    required this.text, this.onTap,
  });
  final String image, text;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 160.w,
        height: 45.h,
        decoration: BoxDecoration(
          border: Border.all(
            color: ColorManager.grey70,
          ),
          borderRadius: BorderRadius.circular(
            12.r,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SvgPicture.asset(
              image,
              width: 26.w,
              height: 26.h,
            ),
            Text(
              text,
              style: Styles.font12Regular,
            )
          ],
        ),
      ),
    );
  }
}
