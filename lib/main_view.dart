import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'features/home/presentation/views/widgets/main_view_body.dart';

class MainView extends StatelessWidget {
  const MainView({super.key, required this.navigationShell});
  final StatefulNavigationShell navigationShell;
  @override
  Widget build(BuildContext context) {
    return MainViewBody(
      navigationShell: navigationShell,
    );
  }
}
