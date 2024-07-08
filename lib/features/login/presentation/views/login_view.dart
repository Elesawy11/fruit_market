import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_market/core/utils/service_locatore.dart';
import 'package:fruit_market/features/login/presentation/cubits/cubit/google_cubit.dart';
import 'package:fruit_market/features/login/presentation/views/widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GoogleCubit(
            getIt.get(),
          ),
        ),
      ],
      child: const Scaffold(
        body: LoginViewBody(),
      ),
    );
  }
}
