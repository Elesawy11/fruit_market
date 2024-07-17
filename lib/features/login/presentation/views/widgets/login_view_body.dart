import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/icons.dart';
import '../../../../../core/utils/routes.dart';
import '../../../../../core/utils/spacer.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/app_text_button.dart';
import '../../cubits/cubit/google_cubit.dart';
import 'login_with_widget.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GoogleCubit, GoogleState>(
      listener: (context, state) {
        if (state is GoogleSuccess) {
          context.pushReplacement(Routes.homeView);
        }
      },
      builder: (context, state) {
        return state is GoogleLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : state is GoogleFailure
                ? Center(
                    child: Text(state.errMessage),
                  )
                : SizedBox(
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
                              onTap: () => BlocProvider.of<GoogleCubit>(context)
                                ..googleAuth(),
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
                  );
      },
    );
  }
}
