import 'package:flutter/material.dart';
import 'package:system_design_flutter/utils/utils.dart';
import 'package:system_design_flutter/widgets/spacing/sd_horizontal_spacing.dart';
import 'package:system_design_flutter/resources/resources.dart';

class SdTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? title;
  final String? hint;
  final VoidCallback? onTap;
  final Widget? rightWidget;
  final bool readOnly;

  const SdTextField({
    required this.controller,
    this.title,
    this.hint,
    this.onTap,
    this.rightWidget,
    this.readOnly = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title.isNotNullAndNotEmpty) ...[
          Text(title!),
          const SdVerticalSpacing(),
        ],
        TextFormField(
          controller: controller,
          cursorColor: SdColors.grey,
          readOnly: readOnly,
          onTap:
              readOnly
                  ? () {
                    FocusScope.of(context).unfocus();
                    onTap?.call();
                  }
                  : null,
          decoration: SdDecorationHelper.textFieldDecoration(
            context,
          ).copyWith(suffixIcon: rightWidget),
          style: SdTextStyle.body14(),
        ),
      ],
    );
  }
}
