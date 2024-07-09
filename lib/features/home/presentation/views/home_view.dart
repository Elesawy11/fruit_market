import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_market/core/utils/spacer.dart';
import '../../../../core/utils/colors.dart';
import '../../../../core/utils/styles.dart';
import 'widgets/custom_product_widget.dart';
import 'widgets/home_view_bar.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with TickerProviderStateMixin {
  late PageController pageViewController;

  int currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    pageViewController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    pageViewController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const HomeViewBar(),
          verticalSpace(40),
          SizedBox(
            height: 25.h,
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: texts.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18.w),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        currentPageIndex = index;
                        pageViewController.animateToPage(
                          currentPageIndex,
                          duration: const Duration(seconds: 1),
                          curve: Curves.easeIn,
                        );
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                      decoration: BoxDecoration(
                        color: currentPageIndex == index
                            ? ColorManager.yellowCC
                            : Theme.of(context).canvasColor,
                        borderRadius: BorderRadius.circular(
                          5.r,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          texts[index],
                          style: Styles.font16SemiBold.copyWith(
                            color: currentPageIndex == index
                                ? Colors.white
                                : ColorManager.grey89,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          verticalSpace(29),
          SizedBox(
            height: 604.h,
            child: PageView(
              scrollDirection: Axis.horizontal,
              onPageChanged: (value) {
                currentPageIndex = value;
                setState(() {});
              },
              controller: pageViewController,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Row(
                        children: [
                          Text(
                            'Organic Fruits',
                            style: Styles.font16SemiBold,
                          ),
                          horizontalSpace(10),
                          Text(
                            '(20% Off)',
                            style: Styles.font12SemiBold.copyWith(
                              color: ColorManager.green4C,
                            ),
                          ),
                        ],
                      ),
                    ),
                    verticalSpace(5),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Text(
                        'Pick up from organic farms',
                        style: Styles.font12Regular,
                      ),
                    ),
                    verticalSpace(16),
                  const  CustomProductWidget()
                  ],
                ),
                Text('Hello Fruits'),
                Text('Hello Dry Fruits'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


List<String> texts = [
  'Vegetables',
  'Fruits',
  'Dry Fruits',
];
