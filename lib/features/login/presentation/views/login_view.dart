import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_market/core/utils/assets.dart';
import 'package:fruit_market/core/utils/colors.dart';
import 'package:fruit_market/core/utils/icons.dart';
import 'package:fruit_market/core/utils/routes.dart';
import 'package:fruit_market/core/utils/spacer.dart';
import 'package:fruit_market/core/utils/styles.dart';
import 'package:fruit_market/core/widgets/app_text_button.dart';
import 'package:go_router/go_router.dart';

import 'widgets/login_with_widget.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            verticalSpace(119),
            Image.asset(
              Assets.assetsImagesLogin,
              width: 221.w,
              height: 166.h,
            ),
            verticalSpace(11),
            Text(
              'Fruit Market',
              style: Styles.font42Bold.copyWith(
                color: ColorManager.green69,
              ),
            ),
            verticalSpace(133),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                LoginWithWidget(
                  image: IconsImage.google,
                  text: 'Log In with',
                ),
                LoginWithWidget(
                  image: IconsImage.facebook,
                  text: 'Log In with',
                ),
              ],
            ),
            verticalSpace(60),
            AppTextButton(
              text: 'Create Account',
              onPressed: () => context.push(
                Routes.createAccountView,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
