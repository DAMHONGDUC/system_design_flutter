import 'package:flutter/material.dart';
import 'package:system_design_flutter/resources/resources.dart';
import 'package:system_design_flutter/widgets/widgets.dart';

enum SdButtonType { primary, secondary }

enum SdButtonWidth { full, fitContent }

/// Configuration class for button colors
class SdButtonColorConfig {
  final Color primaryBgColor;
  final Color primaryTextColor;
  final Color secondaryBgColor;
  final Color secondaryTextColor;
  final Color secondaryBorderColor;
  final Color disabledBgColor;
  final Color disabledTextColor;

  factory SdButtonColorConfig.init() => SdButtonColorConfig(
    primaryBgColor: Colors.blue,
    primaryTextColor: SdColors.white,
    secondaryBgColor: SdColors.white,
    secondaryTextColor: Colors.blue,
    secondaryBorderColor: Colors.blue,
    disabledBgColor: SdColors.grey300,
    disabledTextColor: SdColors.grey500,
  );

  const SdButtonColorConfig({
    required this.primaryBgColor,
    required this.primaryTextColor,
    required this.secondaryBgColor,
    required this.secondaryTextColor,
    required this.secondaryBorderColor,
    required this.disabledBgColor,
    required this.disabledTextColor,
  });

  /// Create a custom color configuration
  SdButtonColorConfig copyWith({
    Color? primaryBgColor,
    Color? primaryTextColor,
    Color? secondaryBgColor,
    Color? secondaryTextColor,
    Color? secondaryBorderColor,
    Color? disabledBgColor,
    Color? disabledTextColor,
  }) {
    return SdButtonColorConfig(
      primaryBgColor: primaryBgColor ?? this.primaryBgColor,
      primaryTextColor: primaryTextColor ?? this.primaryTextColor,
      secondaryBgColor: secondaryBgColor ?? this.secondaryBgColor,
      secondaryTextColor: secondaryTextColor ?? this.secondaryTextColor,
      secondaryBorderColor: secondaryBorderColor ?? this.secondaryBorderColor,
      disabledBgColor: disabledBgColor ?? this.disabledBgColor,
      disabledTextColor: disabledTextColor ?? this.disabledTextColor,
    );
  }
}

class SdButton extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  final SdButtonType type;
  final SdButtonWidth widthType;
  final bool isDisabled;
  final int titleMaxLines;
  final Widget? leading;
  final Widget? trailing;
  final String? subtitle;
  final double? height;
  final SdButtonColorConfig colorConfig;
  final double? width;

  SdButton({
    super.key,
    required this.text,
    this.onTap,
    this.type = SdButtonType.primary,
    this.widthType = SdButtonWidth.full,
    this.isDisabled = false,
    this.titleMaxLines = 1,
    this.leading,
    this.trailing,
    this.subtitle,
    this.height,
    this.width,
    SdButtonColorConfig? colorConfig,
  }) : colorConfig = colorConfig ?? SdButtonColorConfig.init();

  Color _getBackgroundColor() {
    if (isDisabled) {
      return colorConfig.disabledBgColor;
    }

    switch (type) {
      case SdButtonType.primary:
        return colorConfig.primaryBgColor;
      case SdButtonType.secondary:
        return colorConfig.secondaryBgColor;
    }
  }

  Color _getTextColor() {
    if (isDisabled) {
      return colorConfig.disabledTextColor;
    }

    switch (type) {
      case SdButtonType.primary:
        return colorConfig.primaryTextColor;
      case SdButtonType.secondary:
        return colorConfig.secondaryTextColor;
    }
  }

  Border? _getBorder() {
    if (type == SdButtonType.secondary && !isDisabled) {
      return Border.all(color: colorConfig.secondaryBorderColor, width: 1.5);
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final bgColor = _getBackgroundColor();
    final textColor = _getTextColor();
    final border = _getBorder();

    Widget content = Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisSize:
              widthType == SdButtonWidth.fitContent
                  ? MainAxisSize.min
                  : MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (leading != null) ...[
              IconTheme(
                data: IconThemeData(color: textColor, size: 20),
                child: leading!,
              ),
              const SizedBox(width: 8),
            ],
            Flexible(
              fit:
                  widthType == SdButtonWidth.fitContent
                      ? FlexFit.loose
                      : FlexFit.tight,
              child: Text(
                text,
                style: SdTextStyle.body14().copyWith(
                  color: textColor,
                  fontWeight: FontWeight.w600,
                ),
                maxLines: titleMaxLines,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
            ),
            if (trailing != null) ...[
              const SizedBox(width: 8),
              IconTheme(
                data: IconThemeData(color: textColor, size: 20),
                child: trailing!,
              ),
            ],
          ],
        ),
        if (subtitle != null) ...[
          const SizedBox(height: 4),
          Text(
            subtitle!,
            style: SdTextStyle.body14(),
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ],
    );

    return SdInkWell(
      containerBg: bgColor,
      borderRadius: SdSpacing.s100,
      border: border,
      onTap: isDisabled ? null : onTap,
      padding: EdgeInsets.symmetric(
        horizontal:
            widthType == SdButtonWidth.fitContent
                ? SdSpacing.s20
                : SdSpacing.s16,
        vertical: SdSpacing.s12,
      ),
      height: height ?? (subtitle != null ? SdSpacing.s56 : SdSpacing.s48),
      width:
          width ?? (widthType == SdButtonWidth.full ? double.infinity : null),
      child: content,
    );
  }
}
