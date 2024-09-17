import 'package:flutter/material.dart';
import 'package:fruit_market/core/utils/routes.dart';
import 'package:fruit_market/features/my_account/presentation/views/my_account_constant.dart';
import 'package:go_router/go_router.dart';
import 'widgets/custom_mt_account_element_widget.dart';
import 'widgets/custom_my_account_widget.dart';

class MyAccountView extends StatelessWidget {
  const MyAccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const CustomMyAccountWidget(),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.677,
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              itemCount: MyAccountConstant.myAccountElementList.length,
              itemBuilder: (context, index) => CustomMyAccountElementWidget(
                onTap: () {
                  if (index == 0) {
                    context.go('${Routes.myAccountView}/${Routes.myOrderView}');
                  } else if (index == 1) {
                    context.go('${Routes.myAccountView}/${Routes.settings}');
                  }
                },
                icon: MyAccountConstant.myAccountElementList[index][0],
                text: MyAccountConstant.myAccountElementList[index][1],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
