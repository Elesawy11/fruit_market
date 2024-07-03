import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_market/core/utils/routes.dart';
import 'package:fruit_market/core/utils/spacer.dart';
import 'package:fruit_market/core/widgets/app_text_button.dart';
import 'package:go_router/go_router.dart';

import 'widgets/text_and_text_form_widget.dart';

class CreateAccountView extends StatelessWidget {
  const CreateAccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpace(40),
              IconButton(
                onPressed: () => context.pop(),
                icon: const Icon(
                  Icons.arrow_back_ios_new_outlined,
                ),
              ),
              verticalSpace(45),
              const TextAndTextFormWidget(
                text: 'Enter Your Name',
                hintText: 'Name',
              ),
              verticalSpace(34),
              const TextAndTextFormWidget(
                text: 'Enter Your Phone Number',
                hintText: 'Phone',
              ),
              verticalSpace(34),
              const TextAndTextFormWidget(
                maxLines: 3,
                text: 'Add Address',
                hintText: 'Address',
              ),
              verticalSpace(52),
              AppTextButton(
                text: 'Create',
                onPressed: () {
                  context.pushReplacement(Routes.homeView);
                },
                width: double.infinity,
                borderRadius: BorderRadius.circular(
                  12.r,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
