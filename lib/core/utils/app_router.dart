import 'package:flutter/material.dart';
import 'package:fruit_market/core/utils/routes.dart';
import 'package:fruit_market/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:fruit_market/features/login/presentation/views/create_account_view.dart';
import 'package:fruit_market/features/login/presentation/views/login_view.dart';
import 'package:fruit_market/features/onboarding/presentation/views/onboarding_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: Routes.onboardingView,
        builder: (context, state) => const OnboardingView(),
      ),
      GoRoute(
        path: Routes.loginView,
        // builder: (context, state) => const LoginView(),
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: const LoginView(),
            transitionDuration: const Duration(seconds: 5),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity:
                    CurveTween(curve: Curves.elasticInOut).animate(animation),
                child: child,
              );
            },
          );
        },
      ),
      GoRoute(
        path: Routes.createAccountView,
        builder: (context, state) => const CreateAccountView(),
      ),
      GoRoute(
        path: Routes.homeView,
        builder: (context, state) => const HomeViewBody(),
      ),
    ],
  );
}
