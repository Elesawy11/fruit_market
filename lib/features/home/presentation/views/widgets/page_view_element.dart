import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_market/features/home/presentation/cubits/fruit_cubit/fruit_cubit.dart';
import 'package:fruit_market/features/home/presentation/cubits/get_product_cubit/get_products_cubit.dart';

import 'custom_section_widget.dart';

class PageViewElement extends StatelessWidget {
  const PageViewElement({
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
                              ..getFruitProduct(docId: docsId[index]),
                            child: CustomSectionWidget(
                              collectionDetails: state.collectionDetails[index],
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

List<String> docsId = [
  'Mixed Fruit Pack',
  'Organic Fruits',
  'Stone Fruits',
  'melons',
];
