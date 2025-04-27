import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moon_design/moon_design.dart';
import 'package:system_design_flutter/index.dart';

class SdNumberTextField extends StatefulWidget {
  const SdNumberTextField({
    super.key,
    required this.controller,
    required this.title,
    this.focusNode,
    this.rightWidget,
    this.inputFormatters,
    this.allowClear = false,
    this.onChanged,
  });

  final TextEditingController controller;
  final String title;
  final FocusNode? focusNode;
  final Widget? rightWidget;
  final List<TextInputFormatter>? inputFormatters;
  final bool allowClear;
  final Function(String)? onChanged;

  @override
  State<SdNumberTextField> createState() => _SdNumberTextFieldState();
}

class _SdNumberTextFieldState extends State<SdNumberTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: SdSpacingConstants.spacing2),
          child: Text(widget.title, style: SdTextStyle.body10()),
        ),
        SdVerticalSpacing(value: SdSpacingConstants.spacing2),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              flex: 7,
              child: MoonTextInput(
                inputFormatters: widget.inputFormatters,
                controller: widget.controller,
                focusNode: widget.focusNode,
                keyboardType: TextInputType.number,
                onChanged: widget.onChanged,
                trailing:
                    widget.allowClear
                        ? GestureDetector(
                          child: Icon(
                            MoonIcons.controls_close_small_24_light,
                            size: SdIconSize.size24,
                          ),
                          onTap: () {
                            widget.controller.clear();
                            widget.controller.text = '';
                            setState(() {});
                          },
                        )
                        : null,
                style: SdTextStyle.body14(),
              ),
            ),
            SdHorizontalSpacing(value: SdSpacingConstants.spacing6),
            if (widget.rightWidget != null)
              Flexible(
                flex: 3,
                child: widget.rightWidget ?? const SizedBox.shrink(),
              ),
          ],
        ),
        SdVerticalSpacing(value: SdSpacingConstants.spacing8),
      ],
    );
  }
}
