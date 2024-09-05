import 'package:flutter/material.dart';
import 'widgets/custom_my_account_widget.dart';

class MyAccountView extends StatelessWidget {
  const MyAccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomMyAccountWidget(),
    );
  }
}
