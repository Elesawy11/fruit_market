import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_market/features/home/data/models/collection_details.dart';
import 'package:fruit_market/features/home/presentation/cubits/get_vegetables_product/get_vegetables_product_cubit.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/spacer.dart';
import '../../../../../core/utils/styles.dart';
import 'custom_product_widget.dart';

class VegetablesSectionWidget extends StatelessWidget {
  const VegetablesSectionWidget({
    super.key,
    required this.collectionDetails,
  });
  final CollectionDetails collectionDetails;
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
          child:
              BlocBuilder<GetVegetablesProductCubit, GetVegetablesProductState>(
            builder: (context, state) {
              return ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: state is GetVegetablesProductSuccess
                    ? state.productDetails.length
                    : 0,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return state is GetVegetablesProductFailure
                      ? Center(
                          child: Text(state.errMessage),
                        )
                      : state is GetVegetablesProductLoading
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : state is GetVegetablesProductSuccess
                              ? CustomProductWidget(
                                  name: state.productDetails[index].name,
                                  image: state.productDetails[index].image,
                                  price: state.productDetails[index].price,
                                  rate: state.productDetails[index].rate,
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
