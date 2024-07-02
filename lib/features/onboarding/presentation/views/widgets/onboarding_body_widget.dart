import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_market/core/widgets/app_text_button.dart';
import 'package:fruit_market/features/onboarding/presentation/views/constatnt.dart';

import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/spacer.dart';
import '../../../../../core/utils/styles.dart';
import 'onboarding_points_widget.dart';

class OnboardingBodyWidget extends StatelessWidget {
  const OnboardingBodyWidget({
    super.key,
    required this.selectedIndex,
  });

  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: selectedIndex < onboardingImages.length - 1
              ? AppTextButton(
                  text: 'Skip',
                  backgroundColor: Theme.of(context).canvasColor,
                  textStyle: Styles.font14Medium.copyWith(
                    color: ColorManger.grey89,
                  ),
                  width: double.minPositive,
                  height: double.minPositive,
                  onPressed: () {},
                )
              : null,
        ),
        verticalSpace(80),
        Image.asset(
          Assets.assetsOnboarding1,
          width: 272.w,
          height: 210.h,
        ),
        verticalSpace(48),
        Text(
          'E Shopping',
          style: Styles.font20SemiBold,
        ),
        verticalSpace(16),
        Text(
          'Explore  top organic fruits & grab them',
          style: Styles.font15Regular.copyWith(color: ColorManger.grey78),
        ),
        verticalSpace(90),
        OnboardingPointsWidget(
          selectedIndex: selectedIndex,
        ),
        verticalSpace(90),
        AppTextButton(
          text: 'Next',
          onPressed: () {},
        ),
      ],
    );
  }
}
