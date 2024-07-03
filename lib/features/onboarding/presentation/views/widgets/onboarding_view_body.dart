import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_market/core/utils/routes.dart';
import 'package:go_router/go_router.dart';
import '../../cubits/cubit/onboarding_cubit.dart';
import 'onboarding_body_widget.dart';

class OnboardingViewBody extends StatelessWidget {
  const OnboardingViewBody({
    super.key,
    required this.cubit,
  });

  final OnboardingCubit cubit;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: BlocListener<OnboardingCubit, OnboardingState>(
        listener: (context, state) {
          if (state is LastIndex) {
            context.pushReplacement(Routes.loginView);
          }
        },
        child: PageView(
          controller: cubit.pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            OnboardingBodyWidget(
              cubit: cubit,
            ),
            OnboardingBodyWidget(
              cubit: cubit,
            ),
            OnboardingBodyWidget(
              cubit: cubit,
            ),
          ],
        ),
      ),
    );
  }
}
