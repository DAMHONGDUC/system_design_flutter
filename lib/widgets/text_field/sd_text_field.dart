import 'package:flutter/material.dart';
import 'package:moon_design/moon_design.dart';
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
  final TextStyle? textStyle;
  final Color? textColor;
  final Color? activeBorderColor;

  const SdTextField({
    required this.controller,
    this.title,
    this.hint,
    this.onTap,
    this.rightWidget,
    this.readOnly = false,
    this.textStyle,
    this.textColor,
    this.activeBorderColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title.isNotNullAndNotEmpty) ...[
          Text(
            title!,
            style: SdTextStyle.body10().copyWith(color: textColor).wMedium(),
          ),
          SdVerticalSpacing(value: SdSpacingConstants.spacing4),
        ],
        MoonTextInput(
          controller: controller,
          cursorColor: SdColors.grey,
          readOnly: readOnly,
          trailing: rightWidget,
          onTap:
              readOnly
                  ? () {
                    FocusScope.of(context).unfocus();
                    onTap?.call();
                  }
                  : null,
          style: textStyle ?? SdTextStyle.body12(),
          activeBorderColor: activeBorderColor,
        ),
      ],
    );
  }
}
