import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system_design_flutter/resources/resources.dart';

class SdDecorationHelper {
  static textFieldDecoration(
    BuildContext context, {
    Color fillInputDefault = SdColors.white,
    Color borderInputDefault = SdColors.black,
  }) => InputDecoration(
    filled: true,
    fillColor: fillInputDefault,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(SdSpacingConstants.spacing12),
      borderSide: BorderSide(width: 1.sp, color: borderInputDefault),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(SdSpacingConstants.spacing12),
      borderSide: BorderSide(width: 1.sp, color: borderInputDefault),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(SdSpacingConstants.spacing12),
      borderSide: BorderSide(width: 1.sp, color: borderInputDefault),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(SdSpacingConstants.spacing12),
      borderSide: BorderSide(width: 1.sp, color: borderInputDefault),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(SdSpacingConstants.spacing12),
      borderSide: BorderSide(width: 1.sp, color: borderInputDefault),
    ),
  );
}
