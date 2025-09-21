import 'dart:io';

import 'package:flutter/material.dart';
import 'package:system_design_flutter/resources/resources.dart';
import 'package:system_design_flutter/widgets/button/sd_ink_well.dart';
import 'package:system_design_flutter/widgets/icon/sd_icon.dart';

class SdAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? titleText;
  final List<Widget>? actions;
  final Color? backgroundColor;
  final bool centerTitle;
  final bool showBackButton;
  final Color? textColor;
  final Color? shadowColor;
  final Color? backButtonContainerBg;
  final Color? backButtonIconColor;
  final Widget? titleWidget;
  final PreferredSizeWidget? bottom;
  final bool noElevation;

  const SdAppBar({
    super.key,
    this.titleText,
    this.actions,
    this.backgroundColor,
    this.centerTitle = false,
    this.showBackButton = true,
    this.textColor,
    this.shadowColor,
    this.backButtonContainerBg,
    this.backButtonIconColor,
    this.titleWidget,
    this.bottom,
    this.noElevation = false,
  });

  @override
  Widget build(BuildContext context) {
    final spacingWithEdge = SdSpacing.s10;

    return AppBar(
      title:
          titleWidget ??
          (titleText != null
              ? Text(
                titleText!,
                style: SdTextStyle.heading14().copyWith(color: textColor),
              )
              : null),
      centerTitle: centerTitle,
      backgroundColor: backgroundColor ?? Colors.white,
      surfaceTintColor: SdColors.transparent,
      actions: actions,
      leading:
          showBackButton
              ? SdInkWell(
                onTap: () {
                  Navigator.of(context).maybePop();
                },
                child: SdIcon(
                  iconData:
                      Platform.isAndroid
                          ? Icons.arrow_back
                          : Icons.arrow_back_ios_rounded,
                  iconSize: SdSpacing.s20,
                  color: backButtonIconColor,
                ),
              )
              : null,
      titleSpacing: spacingWithEdge,
      actionsPadding: EdgeInsets.only(right: spacingWithEdge),
      elevation: noElevation ? 0 : SdSpacing.s1,
      shadowColor:
          noElevation ? Colors.transparent : (shadowColor ?? SdColors.black54),
      bottom: bottom,
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(kToolbarHeight + (bottom?.preferredSize.height ?? 0));
}
