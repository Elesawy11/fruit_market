import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_market/features/home/presentation/cubits/fruit_cubit/fruit_cubit.dart';
import 'package:fruit_market/features/home/presentation/cubits/get_product_cubit/get_products_cubit.dart';
import 'package:fruit_market/features/home/presentation/views/constant.dart';

import 'fruit_section_widget.dart';

class FruitPageViewElement extends StatelessWidget {
  const FruitPageViewElement({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BlocBuilder<FruitCubit, FruitState>(
        builder: (context, state) {
          return state is FruitLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : state is FruitSuccess
                  ? Column(
                      children: [
                        ...List.generate(state.collectionDetails.length,
                            (index) {
                          return BlocProvider(
                            create: (context) => GetProductsCubit()
                              ..getFruitProduct(
                                  docId: HomeConstant.fruitDocsId[index]),
                            child: FruitSectionWidget(
                              collectionDetails: state.collectionDetails[index],
                              collectionDoc: HomeConstant.fruitDocsId[index],
                              firstCollection: context
                                  .read<GetProductsCubit>()
                                  .collectionName,
                            ),
                          );
                        }),
                      ],
                    )
                  : state is FruitFailure
                      ? Center(
                          child: Text(state.errMessage),
                        )
                      : const Center(
                          child: Text(
                            'Loading....',
                          ),
                        );
        },
      ),
    );
  }
}
