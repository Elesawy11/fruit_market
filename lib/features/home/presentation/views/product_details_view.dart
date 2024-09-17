import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_market/core/utils/colors.dart';
import 'package:fruit_market/core/utils/routes.dart';
import 'package:fruit_market/core/utils/spacer.dart';
import 'package:fruit_market/core/utils/styles.dart';
import 'package:fruit_market/core/widgets/app_text_button.dart';
import 'package:fruit_market/features/home/data/models/product_details.dart';
import 'package:go_router/go_router.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({
    super.key,
    required this.product,
  });

  final ProductDetails product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.go(Routes.homeView),
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        backgroundColor: ColorManager.green69,
        title: Text(
          'DETAILS',
          style: Styles.font14Medium.copyWith(
            color: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpace(24),
                Center(
                  child: Image.network(
                    product.image,
                    width: 335.w,
                    height: 176.h,
                    fit: BoxFit.fill,
                  ),
                ),
                verticalSpace(18),
                Text(
                  product.name,
                  style: Styles.font20SemiBold,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 11.w),
                  child: Text(
                    '''Product will provide natural nutrients. The Chemical 
in organic grapes which can be healthier hair and 
skin. It can be improve Your heart health. Protect your
body from Cancer.''',
                    style: Styles.font12Regular,
                  ),
                ),
                verticalSpace(25),
                Text(
                  'Nutrition',
                  style: Styles.font20SemiBold,
                ),
                verticalSpace(11),
                SizedBox(
                  height: 220.h,
                  child: ListView.builder(
                    itemCount: dottedList.length,
                    itemBuilder: (context, index) => DottedText(
                      text: dottedList[index],
                    ),
                  ),
                ),
                verticalSpace(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${product.price}\$ Per/ kg',
                      style: Styles.font16SemiBold,
                    ),
                    AppTextButton(
                      text: 'Buy Now',
                      onPressed: () {},
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DottedText extends StatelessWidget {
  const DottedText({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Row(
        children: [
          Container(
            height: 7.h,
            width: 7.w,
            decoration: BoxDecoration(
              color: ColorManager.grey83,
              borderRadius: BorderRadius.circular(10.r),
            ),
          ),
          horizontalSpace(13),
          Text(
            text,
            style: Styles.font12Regular,
          ),
        ],
      ),
    );
  }
}

const List<String> dottedList = [
  'Fiber',
  'Potassium',
  'Iron',
  'Magnesium',
  'Vitamin C',
  'Vitamin K',
  'Zinc',
  'Phosphorous',
];
