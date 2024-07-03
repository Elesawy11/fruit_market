import 'package:flutter/material.dart';
import '../../../../../core/utils/spacer.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/app_text_form_field.dart';

class TextAndTextFormWidget extends StatelessWidget {
  const TextAndTextFormWidget({
    super.key,
    required this.text,
    required this.hintText,
    this.maxLines,
  });
  final String text, hintText;
  final int? maxLines;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: Styles.font20SemiBold,
        ),
        verticalSpace(15),
        AppTextFormField(
          maxLines: maxLines,
          hintText: hintText,
          validator: (p0) {},
        )
      ],
    );
  }
}
