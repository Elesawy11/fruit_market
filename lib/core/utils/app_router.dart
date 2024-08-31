import 'package:flutter/material.dart';
import 'package:fruit_market/core/utils/routes.dart';
import 'package:fruit_market/features/home/data/models/product_details.dart';
import 'package:fruit_market/features/home/presentation/views/product_details_view.dart';
import 'package:fruit_market/features/favorite/presentation/views/favorite_view.dart';
import 'package:fruit_market/features/home/presentation/views/home_view.dart';
import 'package:fruit_market/features/home/presentation/views/myaccount_view.dart';
import 'package:fruit_market/features/home/presentation/views/shopping_cart_view.dart';
import 'package:fruit_market/main_view.dart';
import 'package:fruit_market/features/login/presentation/views/create_account_view.dart';
import 'package:fruit_market/features/login/presentation/views/login_view.dart';
import 'package:fruit_market/features/onboarding/presentation/views/onboarding_view.dart';
import 'package:go_router/go_router.dart';
import 'shared_pref.dart';

abstract class AppRouter {
  static final rootNavigatorKey = GlobalKey<NavigatorState>();
  static final router = GoRouter(
    navigatorKey: rootNavigatorKey,
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const OnboardingView(),
        // builder: (context, state) {
        //   if (prefrenceObject != null) {
        //     if (prefrenceObject!.getBool('isLogin') == true) {
        //       return const HomeView();
        //     }
        //   }
        //   return const OnboardingView();
        // },
      ),
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
      StatefulShellRoute.indexedStack(
        parentNavigatorKey: rootNavigatorKey,
        builder: (context, state, navigationShell) => MainView(
          navigationShell: navigationShell,
        ),
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.homeView,
                builder: (context, state) => const HomeView(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.shoppingCartView,
                builder: (context, state) => const ShoppingCartView(),
              )
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.favoriteView,
                builder: (context, state) => const FavoriteView(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.myAccountView,
                builder: (context, state) => const MyAccountView(),
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        parentNavigatorKey: rootNavigatorKey,
        path: Routes.detailsView,
        builder: (context, state) {
          return ProductDetailsView(
            product: state.extra as ProductDetails,
          );
        },
      ),
    ],
  );
}

// abstract class AppRouter {
//   static final rootNavigatorKey = GlobalKey<NavigatorState>();

//   static final router = GoRouter(
//     navigatorKey: rootNavigatorKey,
//     routes: [
//       // GoRoute(
//       //   path: '/',
//       //   builder: (context, state) => const OnboardingView(),
//       //   // builder: (context, state) {
//       //   //   if (prefrenceObject != null) {
//       //   //     if (prefrenceObject!.getBool('isLogin') == true) {
//       //   //       return HomeView();
//       //   //     }
//       //   //   }
//       //   //   return const OnboardingView();
//       //   // },
//       // ),
//       StatefulShellRoute.indexedStack(
//         builder: (context, state, navigationShell) => MainView(
//           navigationShell: navigationShell,
//         ),
//         branches: [
//           StatefulShellBranch(
//             routes: [
//               GoRoute(
//                 path: Routes.homeView,
//                 builder: (context, state) => const HomeView(),
//               ),
//             ],
//           ),
//           StatefulShellBranch(
//             routes: [
//               GoRoute(
//                 path: Routes.shoppingCartView,
//                 builder: (context, state) => const ShoppingCartView(),
//               ),
//             ],
//           ),
//           StatefulShellBranch(
//             routes: [
//               GoRoute(
//                 path: Routes.favoriteView,
//                 builder: (context, state) => const FavoriteView(),
//               ),
//             ],
//           ),
//           StatefulShellBranch(
//             routes: [
//               GoRoute(
//                 path: Routes.myAccountView,
//                 builder: (context, state) => const MyAccountView(),
//               ),
//             ],
//           ),
//         ],
//       ),
//       GoRoute(
//         path: Routes.loginView,
//         // builder: (context, state) => const LoginView(),
//         pageBuilder: (context, state) {
//           return CustomTransitionPage(
//             key: state.pageKey,
//             child: const LoginView(),
//             transitionDuration: const Duration(seconds: 5),
//             transitionsBuilder:
//                 (context, animation, secondaryAnimation, child) {
//               return FadeTransition(
//                 opacity:
//                     CurveTween(curve: Curves.elasticInOut).animate(animation),
//                 child: child,
//               );
//             },
//           );
//         },
//       ),
//       GoRoute(
//         path: Routes.detailsView,
//         builder: (context, state) {
//           // return DetailsView(image: state.extra., name: name, price: price, rate: rate)
//           return ProductDetailsView(
//             product: state.extra as ProductDetails,
//           );
//         },
//       ),
//       GoRoute(
//         path: Routes.createAccountView,
//         builder: (context, state) => const CreateAccountView(),
//       ),
//       // GoRoute(
//       //   path: Routes.homeView,
//       //   builder: (context, state) => const MainViewBody(),
//       // ),
//     ],
//   );
// }
