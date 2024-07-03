import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_market/features/onboarding/presentation/cubits/cubit/onboarding_cubit.dart';
import 'widgets/onboarding_view_body.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnboardingCubit()..systemUi(),
      child: Builder(
        builder: (context) {
          final OnboardingCubit cubit =
              BlocProvider.of<OnboardingCubit>(context);
          return Scaffold(
            body: OnboardingViewBody(
              cubit: cubit,
            ),
          );
        },
      ),
    );
  }
}
