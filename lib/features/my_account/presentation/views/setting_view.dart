import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_market/core/utils/icons.dart';
import 'package:fruit_market/features/my_account/presentation/views/my_account_constant.dart';
import 'package:fruit_market/features/my_account/presentation/views/widgets/custom_mt_account_element_widget.dart';

import '../../../../core/utils/colors.dart';
import '../../../../core/utils/styles.dart';

class SettingView extends StatelessWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorManager.green69,
        title: Text(
          'Settings',
          style: Styles.font14Medium.copyWith(color: Colors.white),
        ),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      body: ListView.builder(
        itemCount: MyAccountConstant.settingList.length,
        itemBuilder: (context, index) {
          return CustomMyAccountElementWidget(
            text: MyAccountConstant.settingList[index][1],
            icon: MyAccountConstant.settingList[index][0],
            onTap: () {},
          );
        },
      ),
    );
  }
}
