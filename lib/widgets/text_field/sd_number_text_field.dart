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
    this.hintText,
    this.limitValue,
    this.onlyInt = false,
    this.textColor,
    this.inputHintColor,
    this.activeBorderColor,
  });

  final TextEditingController controller;
  final String title;
  final FocusNode? focusNode;
  final Widget? rightWidget;
  final List<TextInputFormatter>? inputFormatters;
  final bool allowClear;
  final Function(String)? onChanged;
  final String? hintText;
  final int? limitValue;
  final bool onlyInt;
  final Color? textColor;
  final Color? inputHintColor;
  final Color? activeBorderColor;

  @override
  State<SdNumberTextField> createState() => _SdNumberTextFieldState();
}

class _SdNumberTextFieldState extends State<SdNumberTextField> {
  bool _showError = false;
  late int _limitValue;

  @override
  void initState() {
    _limitValue = widget.limitValue ?? SdConstants.limitAmount;
    super.initState();
  }

  void _onTapClear() {
    widget.controller.clear();
    widget.controller.text = '';
    setState(() {
      _showError = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: SdSpacingConstants.spacing2),
          child: Text(
            widget.title,
            style:
                SdTextStyle.body10()
                    .copyWith(color: widget.textColor)
                    .wMedium(),
          ),
        ),
        SdVerticalSpacing(value: SdSpacingConstants.spacing4),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              flex: 7,
              child: MoonTextInput(
                hintText: widget.hintText,
                hintTextColor: widget.inputHintColor ?? SdColors.grey600,
                inputFormatters: [
                  ...?widget.inputFormatters,
                  if (widget.onlyInt) SdFormatHelper.intFormatter(),
                  SdFormatHelper.limitFormatter(
                    limit: _limitValue,
                    currentErrorState: _showError,
                    onErrorChanged: (showError) {
                      setState(() {
                        _showError = showError;
                      });
                    },
                  ),
                ],
                controller: widget.controller,
                focusNode: widget.focusNode,
                keyboardType: TextInputType.number,
                onChanged: widget.onChanged,
                trailing:
                    widget.allowClear
                        ? GestureDetector(
                          child: SdIcon(
                            iconData: MoonIcons.controls_close_small_24_light,
                            color: widget.inputHintColor,
                          ),
                          onTap: _onTapClear,
                        )
                        : null,
                style: SdTextStyle.body14(),
                activeBorderColor: widget.activeBorderColor,
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
        if (_showError)
          Padding(
            padding: EdgeInsets.only(
              left: SdSpacingConstants.spacing2,
              top: SdSpacingConstants.spacing2,
            ),
            child: Text(
              'Max value is: ${SdFormatHelper.formatMoneyFromDouble(_limitValue.toDouble())}',
              style: SdTextStyle.body9().withColor(SdColors.red),
            ),
          ),
        SdVerticalSpacing(value: SdSpacingConstants.spacing8),
      ],
    );
  }
}
