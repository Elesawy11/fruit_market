import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_market/core/utils/app_router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fruit_market/core/utils/colors.dart';
import 'package:fruit_market/core/utils/service_locatore.dart';
import 'package:fruit_market/core/utils/shared_pref.dart';
import 'package:fruit_market/features/onboarding/presentation/cubits/cubit/onboarding_cubit.dart';
import 'firebase_options.dart';
import 'simple_bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  serviceLocatore();
  getSharedPref();
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.light.copyWith(
      statusBarColor: ColorManager.green69,
    ),
  );
  Bloc.observer = SimpleBlocObserver();
  runApp(const FruitMarket());
}

class FruitMarket extends StatelessWidget {
  const FruitMarket({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: BlocProvider(
        // create: (context) => OnboardingCubit()..systemUi(),
        create: (context) => OnboardingCubit(),
        child: MaterialApp.router(
          theme: ThemeData(
            colorSchemeSeed: Colors.white,
          ),
          routerConfig: AppRouter.router,
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}
