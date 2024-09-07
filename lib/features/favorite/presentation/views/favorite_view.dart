import 'package:flutter/material.dart';
import 'package:fruit_market/core/utils/colors.dart';
import 'package:fruit_market/core/utils/styles.dart';
import 'widgets/favorite_view_element.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorManager.green69,
        title: Text(
          'Favourites',
          style: Styles.font14Medium.copyWith(
            color: Colors.white,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: 6,
        itemBuilder: (context, index) {
          return const FavoriteViewElement();
        },
      ),
    );
  }
}
