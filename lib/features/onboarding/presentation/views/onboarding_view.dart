import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_market/core/utils/assets.dart';
import 'package:fruit_market/core/utils/colors.dart';
import 'package:fruit_market/core/utils/spacer.dart';
import 'package:fruit_market/core/utils/styles.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  int isSelected = 0;
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: Text(
                  'Skip',
                  style:
                      Styles.font14Regular.copyWith(color: ColorManger.grey89),
                ),
              ),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                3,
                (index) => Container(
                  margin: const EdgeInsets.only(right: 8),
                  height: 10.h,
                  width: 10.w,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: ColorManger.green69,
                    ),
                    borderRadius: BorderRadius.circular(5),
                    color: isSelected == index
                        ? ColorManger.green69
                        : Colors.white,
                  ),
                ),
              ),
            ),
            verticalSpace(90),
            TextButton(
              onPressed: () {},
              child: Container(
                width: 146.w,
                height: 48.h,
                decoration: BoxDecoration(
                  color: ColorManger.green69,
                  borderRadius: BorderRadius.circular(
                    5.r,
                  ),
                ),
                child: Center(
                  child: Text(
                    'Next',
                    style: Styles.font14Medium.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Row OnboardingPoints() {
  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.center,
  //     children: List.generate(
  //       3,
  //       (index) => Container(
  //         margin: const EdgeInsets.only(right: 4),
  //         height: 7.h,
  //         width: isSelected == index ? 20.w : 7.w,
  //         decoration: BoxDecoration(
  //           borderRadius: BorderRadius.circular(3),
  //           color: isSelected == index ? ColorManger.green69 : Colors.grey,
  //         ),
  //       ),
  //     ),
  //   );
  // }
}
