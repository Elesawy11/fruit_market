import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_market/core/utils/colors.dart';
import 'package:fruit_market/core/utils/service_locatore.dart';
import 'package:fruit_market/core/utils/styles.dart';
import 'package:fruit_market/features/favorite/presentation/cubits/get_cart_product/get_cart_product_cubit.dart';
import 'package:fruit_market/features/favorite/presentation/cubits/make_product_in_cart/make_product_in_cart_cubit.dart';
import 'package:fruit_market/features/home/data/firebase/home_firebase.dart';
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
      body: BlocProvider(
        create: (context) => GetCartProductCubit()..getFavoriteProduct(),
        child: BlocBuilder<GetCartProductCubit, GetCartProductState>(
          builder: (context, state) {
            return state is GetCartProductSuccess
                ? ListView.builder(
                    itemCount: state.cartProduct.length,
                    itemBuilder: (context, index) {
                      return BlocProvider(
                        create: (context) =>
                            MakeProductInCartCubit(getIt.get<HomeFirebase>()),
                        child: ShoppingCartElement(
                          product: state.cartProduct[index],
                        ),
                      );
                    },
                  )
                : state is GetCartProductFailure
                    ? Center(
                        child: Text(state.errMessage),
                      )
                    : const Center(
                        child: CircularProgressIndicator(),
                      );
          },
        ),
      ),
    );
  }
}
