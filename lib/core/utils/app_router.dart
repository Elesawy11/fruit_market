import 'package:flutter/material.dart';
import 'package:fruit_market/core/utils/routes.dart';
import 'package:fruit_market/features/home/data/models/product_details.dart';
import 'package:fruit_market/features/home/presentation/views/details_view.dart';
import 'package:fruit_market/main_view.dart';
import 'package:fruit_market/features/home/presentation/views/widgets/main_view_body.dart';
import 'package:fruit_market/features/login/presentation/views/create_account_view.dart';
import 'package:fruit_market/features/login/presentation/views/login_view.dart';
import 'package:fruit_market/features/onboarding/presentation/views/onboarding_view.dart';
import 'package:go_router/go_router.dart';

import 'shared_pref.dart';

abstract class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) {
          if (prefrenceObject != null) {
            if (prefrenceObject!.getBool('isLogin') == true) {
              return const MainView();
            }
          }
          return const OnboardingView();
        },
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
        path: Routes.detailsView,
        builder: (context, state) {
          // return DetailsView(image: state.extra., name: name, price: price, rate: rate)
          return DetailsView(
            product: state.extra as ProductDetails,
          );
        },
      ),
      GoRoute(
        path: Routes.createAccountView,
        builder: (context, state) => const CreateAccountView(),
      ),
      GoRoute(
        path: Routes.homeView,
        builder: (context, state) => const MainViewBody(),
      ),
    ],
  );
}
