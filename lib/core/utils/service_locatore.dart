import 'package:fruit_market/core/utils/app_router.dart';
import 'package:fruit_market/features/home/data/firebase/home_firebase.dart';
import 'package:fruit_market/features/login/data/firebase/google_auth.dart';
import 'package:fruit_market/features/login/presentation/cubits/cubit/google_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void serviceLocatore() {
  // FirebaseServices firebaseServices = FirebaseServices();
  // getIt.registerLazySingleton<GoogleCubit>(
  //   () => GoogleCubit(
  //     firebaseServices,
  //   ),
  // );
  // getIt.registerLazySingleton<AppRouter>(()=> AppRout);
  getIt.registerLazySingleton<FirebaseAuthServices>(() => FirebaseAuthServices());
  getIt.registerLazySingleton<HomeFirebase>(() => HomeFirebase());
}
