import 'package:flutter/material.dart';

import 'custom_section_widget.dart';

class PageViewElement extends StatelessWidget {
  const PageViewElement({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          CustomSectionWidget(),
          CustomSectionWidget(),
          CustomSectionWidget(),
        ],
      ),
    );
  }
}