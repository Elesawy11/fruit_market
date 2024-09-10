import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_market/features/home/data/models/collection_details.dart';
import 'package:fruit_market/features/home/presentation/cubits/get_dry_druit_product_cubit/get_dry_fruit_product_cubit.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/spacer.dart';
import '../../../../../core/utils/styles.dart';
import 'custom_product_widget.dart';

class DryFruitSectionWidget extends StatelessWidget {
  const DryFruitSectionWidget({
    super.key,
    required this.collectionDetails, required this.firstCollection, required this.collectionDoc,
  });
  final CollectionDetails collectionDetails;
  final String firstCollection;
  final String collectionDoc;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Row(
            children: [
              Text(
                collectionDetails.name,
                style: Styles.font16SemiBold,
              ),
              horizontalSpace(10),
              Text(
                '(${collectionDetails.discount}% Off)',
                style: Styles.font12SemiBold.copyWith(
                  color: ColorManager.green4C,
                ),
              ),
            ],
          ),
        ),
        verticalSpace(5),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Text(
            collectionDetails.description,
            style: Styles.font12Regular,
          ),
        ),
        verticalSpace(16),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.30,
          child: BlocBuilder<GetDryFruitProductCubit, GetDryFruitProductState>(
            builder: (context, state) {
              return ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: state is GetDryFruitProductSuccess
                    ? state.productDetails.length
                    : 0,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return state is GetDryFruitProductFailure
                      ? Center(
                          child: Text(state.errMessage),
                        )
                      : state is GetDryFruitProductLoading
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : state is GetDryFruitProductSuccess
                              ? CustomProductWidget(
                                  product: state.productDetails[index],
                                  firstCollection: firstCollection,
                                  collectionDoc: collectionDoc,
                                )
                              : const Center(
                                  child: Text(
                                    'Sorry there is an error in server',
                                  ),
                                );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
