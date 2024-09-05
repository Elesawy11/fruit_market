import 'package:flutter/material.dart';
import 'widgets/custom_mt_account_element_widget.dart';
import 'widgets/custom_my_account_widget.dart';

class MyAccountView extends StatelessWidget {
  const MyAccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          CustomMyAccountWidget(),
          CustomMyAccountElementWidget(
            icon: Icons.favorite,
            text: 'Ahmed Elesawy',
          ),
        ],
      ),
    );
  }
}
