import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_market/features/home/presentation/cubits/dry_druit_cubit/dry_fruit_cubit.dart';
import 'package:fruit_market/features/home/presentation/cubits/get_dry_druit_product_cubit/get_dry_fruit_product_cubit.dart';
import 'package:fruit_market/features/home/presentation/views/constant.dart';
import 'package:fruit_market/features/home/presentation/views/widgets/dry_fruit_section_widget.dart';

class DryFruitPageViewElement extends StatelessWidget {
  const DryFruitPageViewElement({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BlocBuilder<DryFruitCubit, DryFruitState>(
        builder: (context, state) {
          return state is DryFruitLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : state is DryFruitSuccess
                  ? Column(
                      children: [
                        ...List.generate(state.collectionDetails.length,
                            (index) {
                          return BlocProvider(
                            create: (context) => GetDryFruitProductCubit()
                              ..getDryFruitProduct(
                                  docId: HomeConstant.dryFruitsDocsId[index]),
                            child: DryFruitSectionWidget(
                              collectionDetails: state.collectionDetails[index],
                            ),
                          );
                        }),
                      ],
                    )
                  : state is DryFruitFailure
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
