import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_market/features/home/presentation/cubits/dry_druit_cubit/dry_fruit_cubit.dart';
import 'package:fruit_market/features/home/presentation/cubits/fruit_cubit/fruit_cubit.dart';
import 'package:fruit_market/features/home/presentation/views/widgets/main_view_body.dart';

import 'features/home/presentation/cubits/vegetables_cubit/vegetables_cubit.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(
        create: (context) => VegetablesCubit()..getVegetablData(),
      ),
      BlocProvider(
        create: (context) => FruitCubit()..getFruitData(),
      ),
      BlocProvider(
        create: (context) => DryFruitCubit()..getDryFruitData(),
      ),
    ], child: const MainViewBody());
  }
}
