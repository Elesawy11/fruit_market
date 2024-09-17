import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_market/core/utils/colors.dart';
import 'package:fruit_market/core/utils/service_locatore.dart';
import 'package:fruit_market/core/utils/styles.dart';
import 'package:fruit_market/features/favorite/presentation/cubits/get_favorite_product/get_favorite_product_cubit.dart';
import 'package:fruit_market/features/favorite/presentation/cubits/make_product_favorite/make_product_favorite_cubit.dart';
import 'package:fruit_market/features/home/data/firebase/home_firebase.dart';
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
      body: BlocProvider(
        create: (context) => GetFavoriteProductCubit()..getFavoriteProduct(),
        child: BlocBuilder<GetFavoriteProductCubit, GetFavoriteProductState>(
          builder: (context, state) {
            return state is GetFavoriteProductFailure
                ? Center(
                    child: Text(
                      state.errMessage,
                    ),
                  )
                : state is GetFavoriteProductSuccess
                    ? ListView.builder(
                        itemCount: state.favoriteList.length,
                        itemBuilder: (context, index) {
                          return BlocProvider(
                            create: (context) => MakeProductFavoriteCubit(
                                getIt.get<HomeFirebase>()),
                            child: FavoriteViewElement(
                              product: state.favoriteList[index],
                            ),
                          );
                        },
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
