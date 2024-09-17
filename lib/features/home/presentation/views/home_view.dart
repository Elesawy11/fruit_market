import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_market/core/utils/service_locatore.dart';
import 'package:fruit_market/features/favorite/presentation/cubits/make_product_in_cart/make_product_in_cart_cubit.dart';
import 'package:fruit_market/features/home/data/firebase/home_firebase.dart';
import 'package:fruit_market/features/favorite/presentation/cubits/make_product_favorite/make_product_favorite_cubit.dart';
import 'package:fruit_market/features/home/presentation/views/widgets/home_view_body.dart';
import '../cubits/dry_druit_cubit/dry_fruit_cubit.dart';
import '../cubits/fruit_cubit/fruit_cubit.dart';
import '../cubits/vegetables_cubit/vegetables_cubit.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: FloatingActionButton(onPressed: () {
      //   HomeFirebase().sendDataToFireStore();
      // }),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => VegetablesCubit()..getVegetablData(),
          ),
          BlocProvider(
            create: (context) => FruitCubit()..getFruitData(),
          ),
          BlocProvider(
            create: (context) => DryFruitCubit()..getDryFruitData(),
          ),
          BlocProvider(
              create: (context) =>
                  MakeProductFavoriteCubit(getIt.get<HomeFirebase>())),
          BlocProvider(
              create: (context) =>
                  MakeProductInCartCubit(getIt.get<HomeFirebase>()))
        ],
        child: const HomeViewBody(),
      ),
    );
  }
}
