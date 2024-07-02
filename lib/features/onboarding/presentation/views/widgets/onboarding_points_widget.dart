import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_market/features/onboarding/presentation/views/constatnt.dart';

import '../../../../../core/utils/colors.dart';

class OnboardingPointsWidget extends StatelessWidget {
  const OnboardingPointsWidget({
    super.key,
    required this.selectedIndex,
  });

  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        onboardingImages.length,
        (index) => Container(
          margin: const EdgeInsets.only(right: 8),
          height: 10.h,
          width: 10.w,
          decoration: BoxDecoration(
            border: Border.all(
              color: ColorManger.green69,
            ),
            borderRadius: BorderRadius.circular(5),
            color:
                selectedIndex == index ? ColorManger.green69 : Colors.white,
          ),
        ),
      ),
    );
  }
}
