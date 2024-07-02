import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'widgets/onboarding_body_widget.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  int selectedIndex = 0;
  PageController pageController = PageController();
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
        child: PageView(
          children: [
            OnboardingBodyWidget(selectedIndex: selectedIndex),
            OnboardingBodyWidget(selectedIndex: selectedIndex),
          ],
        ),
      ),
    );
  }
}
