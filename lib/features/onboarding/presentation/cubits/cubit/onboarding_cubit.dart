import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meta/meta.dart';

part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(OnboardingInitial());
  final PageController pageController = PageController();
  int selectedIndex = 0;
  void systemUi() =>
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

  void increaseIndex() {
    selectedIndex += 1;
    pageController.animateToPage(
      selectedIndex,
      duration: const Duration(milliseconds: 5),
      curve: Curves.bounceIn,
    );
  }
}
