import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/colors.dart';

class CustomAddOrRemoveButton extends StatelessWidget {
  const CustomAddOrRemoveButton({
    super.key,
    this.onTap,
    required this.icon,
  });
  final void Function()? onTap;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 25.w,
        height: 25.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: ColorManager.grey39,
          ),
        ),
        child: Icon(
          icon,
        ),
      ),
    );
  }
}
