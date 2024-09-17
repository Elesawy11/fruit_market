import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fruit_market/core/utils/colors.dart';
import 'package:fruit_market/core/utils/styles.dart';
import 'package:fruit_market/features/my_account/presentation/views/widgets/custom_order_product.dart';

class MyOrderView extends StatelessWidget {
  const MyOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorManager.green69,
        title: Text(
          'My Orders',
          style: Styles.font14Medium.copyWith(color: Colors.white),
        ),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      body: ListView.builder(
        itemCount: 6,
        itemBuilder: (context, index) {
          return const CustomOrderProduct();
        },
      ),
    );
  }
}
