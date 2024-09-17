import 'package:fruit_market/features/favorite/presentation/cubits/make_product_favorite/make_product_favorite_cubit.dart';
import 'package:fruit_market/features/favorite/presentation/cubits/make_product_in_cart/make_product_in_cart_cubit.dart';
import 'package:fruit_market/features/home/data/firebase/home_firebase.dart';
import 'package:fruit_market/features/login/data/firebase/google_auth.dart';
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
  getIt.registerLazySingleton<FirebaseAuthServices>(
      () => FirebaseAuthServices());

  getIt.registerLazySingleton<HomeFirebase>(() => HomeFirebase());

  getIt.registerLazySingleton<MakeProductFavoriteCubit>(
    () => MakeProductFavoriteCubit(getIt.get<HomeFirebase>()),
  );

  getIt.registerLazySingleton<MakeProductInCartCubit>(
      () => MakeProductInCartCubit(getIt.get<HomeFirebase>()));
}
