import 'package:flutter/material.dart';
import 'package:fruit_market/core/utils/colors.dart';
import 'package:fruit_market/core/utils/styles.dart';
import 'package:fruit_market/features/shopping_cart/presentation/views/widgets/shopping_cart_element.dart';

class ShoppingCartView extends StatelessWidget {
  const ShoppingCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorManager.green69,
        title: Text(
          'Shopping Cart',
          style: Styles.font14Medium.copyWith(
            color: Colors.white,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: 6,
        itemBuilder: (context, index) {
          return const ShoppingCartElement();
        },
      ),
    );
  }
}
