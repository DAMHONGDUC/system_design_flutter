import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moon_design/moon_design.dart';
import 'package:system_design_flutter/index.dart';

class SdAmountTextField extends StatelessWidget {
  const SdAmountTextField({
    super.key,
    required this.controller,
    required this.title,
    this.focusNode,
    this.rightWidget,
  });

  final TextEditingController controller;
  final String title;
  final FocusNode? focusNode;
  final Widget? rightWidget;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: SdSpacingConstants.spacing2),
          child: Text(title, style: SdTextStyle.body12()),
        ),
        SdVerticalSpacing(value: SdSpacingConstants.spacing2),
        Row(
          children: [
            Flexible(
              flex: 7,
              child: SizedBox(
                height: 50.sp,
                child: MoonTextInput(
                  controller: controller,
                  focusNode: focusNode,
                  keyboardType: TextInputType.number,
                  // cursorColor: context.appTheme.inputCursor,
                  style: SdTextStyle.body14(),
                ),
              ),
            ),
            SdHorizontalSpacing(value: SdSpacingConstants.spacing6),
            if (rightWidget != null)
              Flexible(
                flex: 3,
                child:
                    rightWidget != null
                        ? rightWidget!
                        : const SizedBox.shrink(),
              ),
          ],
        ),
      ],
    );
  }
}
