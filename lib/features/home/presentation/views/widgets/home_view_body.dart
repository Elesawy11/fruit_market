import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_market/core/utils/spacer.dart';
import 'package:fruit_market/features/home/presentation/cubits/fruit_cubit/fruit_cubit.dart';
import 'package:fruit_market/features/home/presentation/views/constant.dart';
import 'package:fruit_market/features/home/presentation/views/widgets/dry_fruit_page_view_element.dart';
import 'package:fruit_market/features/home/presentation/views/widgets/vegetable_page_view_element.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/styles.dart';
import 'home_view_bar.dart';
import 'fruit_page_view_element.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody>
    with TickerProviderStateMixin {
  final ImagePicker imagePicker = ImagePicker();
  File? pickedImage;

  Future<void> pickImageFromGallery() async {
    final image = await imagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      pickedImage = image != null ? File(image.path) : null;
    });
  }

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
              itemCount: HomeConstant.sectionsName.length,
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
                          HomeConstant.sectionsName[index],
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
                const VegetablePageViewElement(),
                BlocProvider(
                  create: (context) => FruitCubit()..getFruitData(),
                  child: const FruitPageViewElement(),
                ),
                const DryFruitPageViewElement(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
