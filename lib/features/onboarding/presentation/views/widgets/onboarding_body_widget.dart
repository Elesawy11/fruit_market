import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_market/core/widgets/app_text_button.dart';
import 'package:fruit_market/features/home/presentation/views/home_view.dart';
import 'package:fruit_market/features/onboarding/presentation/cubits/cubit/onboarding_cubit.dart';
import 'package:fruit_market/features/onboarding/presentation/views/constatnt.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/spacer.dart';
import '../../../../../core/utils/styles.dart';
import 'onboarding_points_widget.dart';

class OnboardingBodyWidget extends StatelessWidget {
  const OnboardingBodyWidget({
    super.key,
    required this.cubit,
  });

  final OnboardingCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: cubit.selectedIndex < onboardingList.length - 1
              ? AppTextButton(
                  text: 'Skip',
                  backgroundColor: Theme.of(context).canvasColor,
                  textStyle: Styles.font14Medium.copyWith(
                    color: ColorManger.grey89,
                  ),
                  width: double.minPositive,
                  height: double.minPositive,
                  onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const HomeView(),
                    ),
                  ),
                )
              : null,
        ),
        verticalSpace(80),
        Image.asset(
          onboardingList[cubit.selectedIndex][0],
          width: 272.w,
          height: 210.h,
        ),
        verticalSpace(48),
        Text(
          onboardingList[cubit.selectedIndex][1],
          style: Styles.font20SemiBold,
        ),
        verticalSpace(16),
        Text(
          onboardingList[cubit.selectedIndex][2],
          style: Styles.font15Regular.copyWith(
            color: ColorManger.grey78,
          ),
        ),
        verticalSpace(90),
        OnboardingPointsWidget(
          selectedIndex: cubit.selectedIndex,
        ),
        verticalSpace(90),
        AppTextButton(
          text: cubit.selectedIndex == onboardingList.length - 1
              ? 'Get Started'
              : 'Next',
          onPressed: () => cubit.increaseIndex(),
        ),
      ],
    );
  }
}
