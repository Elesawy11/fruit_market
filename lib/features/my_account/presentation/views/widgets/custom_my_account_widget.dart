import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/icons.dart';
import '../../../../../core/utils/spacer.dart';
import '../../../../../core/utils/styles.dart';

class CustomMyAccountWidget extends StatelessWidget {
  const CustomMyAccountWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.25,
      width: double.infinity,
      color: ColorManager.green69,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            left: 0,
            right: 0,
            child: Column(
              children: [
                verticalSpace(50),
                CircleAvatar(
                  radius: 41.r,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 40.r,
                    backgroundColor: Colors.white,
                    backgroundImage: const AssetImage(
                      Assets.assetsImagesAccount,
                    ),
                  ),
                ),
                Text(
                  'Ahmed Elesawy',
                  style: Styles.font16SemiBold.copyWith(
                    color: Colors.white,
                  ),
                ),
                Text(
                  'elesawy21@gmail.com',
                  style: Styles.font12Regular.copyWith(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: 19.w,
            top: 40.h,
            child: IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                IconsImage.edit,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
