import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_market/features/home/presentation/cubits/get_vegetables_product/get_vegetables_product_cubit.dart';
import 'package:fruit_market/features/home/presentation/cubits/vegetables_cubit/vegetables_cubit.dart';
import 'package:fruit_market/features/home/presentation/views/constant.dart';
import 'package:fruit_market/features/home/presentation/views/widgets/vegetables_section_widget.dart';

class VegetablePageViewElement extends StatelessWidget {
  const VegetablePageViewElement({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => VegetablesCubit()..getVegetablData(),
      child: SingleChildScrollView(
        child: BlocBuilder<VegetablesCubit, VegetablesState>(
          builder: (context, state) {
            return state is VegetablesLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : state is VegetablesSuccess
                    ? Column(
                        children: [
                          ...List.generate(state.collectionDetails.length,
                              (index) {
                            return BlocProvider(
                              create: (context) => GetVegetablesProductCubit()
                                ..getVegetablesProduct(
                                    docId:
                                        HomeConstant.vegetablesDocsId[index]),
                              child: VegetablesSectionWidget(
                                collectionDetails:
                                    state.collectionDetails[index],
                              ),
                            );
                          }),
                        ],
                      )
                    : state is VegetablesFailure
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
      ),
    );
  }
}
