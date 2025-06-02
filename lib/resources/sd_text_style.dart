import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system_design_flutter/resources/resources.dart';
import 'package:system_design_flutter/theme/sd_theme.dart';
import 'package:system_design_flutter/resources/sd_colors.dart';

abstract class SdBaseTextStyle {
  static TextStyle base({
    double fontSize = 10,
    FontWeight fontWeight = FontWeight.w400,
    Color color = SdColors.black,
  }) {
    return TextStyle(
      fontFamily: SdConstants.sdFontFamily,
      fontSize: fontSize.sp,
      fontWeight: fontWeight,
      color: color,
    );
  }
}

class SdTextStyle extends SdBaseTextStyle {
  SdTextStyle._();

  // Body styles (regular weight)
  static TextStyle body6() => SdBaseTextStyle.base(fontSize: 6.sp);
  static TextStyle body8() => SdBaseTextStyle.base(fontSize: 8.sp);
  static TextStyle body9() => SdBaseTextStyle.base(fontSize: 9.sp);
  static TextStyle body10() => SdBaseTextStyle.base(fontSize: 10.sp);
  static TextStyle body12() => SdBaseTextStyle.base(fontSize: 12.sp);
  static TextStyle body14() => SdBaseTextStyle.base(fontSize: 14.sp);
  static TextStyle body16() => SdBaseTextStyle.base(fontSize: 16.sp);
  static TextStyle body18() => SdBaseTextStyle.base(fontSize: 18.sp);
  static TextStyle body20() => SdBaseTextStyle.base(fontSize: 20.sp);
  static TextStyle body24() => SdBaseTextStyle.base(fontSize: 24.sp);
  static TextStyle body32() => SdBaseTextStyle.base(fontSize: 32.sp);
  static TextStyle body40() => SdBaseTextStyle.base(fontSize: 40.sp);
  static TextStyle body48() => SdBaseTextStyle.base(fontSize: 48.sp);
  static TextStyle body56() => SdBaseTextStyle.base(fontSize: 56.sp);
  static TextStyle body64() => SdBaseTextStyle.base(fontSize: 64.sp);
  static TextStyle body72() => SdBaseTextStyle.base(fontSize: 72.sp);

  // Heading styles (semi-bold)
  static TextStyle heading6() =>
      SdBaseTextStyle.base(fontSize: 6.sp, fontWeight: FontWeight.w600);
  static TextStyle heading8() =>
      SdBaseTextStyle.base(fontSize: 8.sp, fontWeight: FontWeight.w600);
  static TextStyle heading9() =>
      SdBaseTextStyle.base(fontSize: 9.sp, fontWeight: FontWeight.w600);
  static TextStyle heading10() =>
      SdBaseTextStyle.base(fontSize: 10.sp, fontWeight: FontWeight.w600);
  static TextStyle heading12() =>
      SdBaseTextStyle.base(fontSize: 12.sp, fontWeight: FontWeight.w600);
  static TextStyle heading13() =>
      SdBaseTextStyle.base(fontSize: 13.sp, fontWeight: FontWeight.w600);
  static TextStyle heading14() =>
      SdBaseTextStyle.base(fontSize: 14.sp, fontWeight: FontWeight.w600);
  static TextStyle heading16() =>
      SdBaseTextStyle.base(fontSize: 16.sp, fontWeight: FontWeight.w600);
  static TextStyle heading18() =>
      SdBaseTextStyle.base(fontSize: 18.sp, fontWeight: FontWeight.w600);
  static TextStyle heading20() =>
      SdBaseTextStyle.base(fontSize: 20.sp, fontWeight: FontWeight.w600);
  static TextStyle heading24() =>
      SdBaseTextStyle.base(fontSize: 24.sp, fontWeight: FontWeight.w600);
  static TextStyle heading32() =>
      SdBaseTextStyle.base(fontSize: 32.sp, fontWeight: FontWeight.w600);
  static TextStyle heading40() =>
      SdBaseTextStyle.base(fontSize: 40.sp, fontWeight: FontWeight.w600);
  static TextStyle heading48() =>
      SdBaseTextStyle.base(fontSize: 48.sp, fontWeight: FontWeight.w600);
  static TextStyle heading56() =>
      SdBaseTextStyle.base(fontSize: 56.sp, fontWeight: FontWeight.w600);
  static TextStyle heading64() =>
      SdBaseTextStyle.base(fontSize: 64.sp, fontWeight: FontWeight.w600);
  static TextStyle heading72() =>
      SdBaseTextStyle.base(fontSize: 72.sp, fontWeight: FontWeight.w600);
}

extension TextStyleExt on TextStyle {
  TextStyle wLight() => copyWith(fontWeight: FontWeight.w300);
  TextStyle wRegular() => copyWith(fontWeight: FontWeight.w400);
  TextStyle wMedium() => copyWith(fontWeight: FontWeight.w500);
  TextStyle wSemiBold() => copyWith(fontWeight: FontWeight.w600);
  TextStyle wBold() => copyWith(fontWeight: FontWeight.w700);
  TextStyle withColor(Color color) => copyWith(color: color);
  TextStyle size(double fontSize) => copyWith(fontSize: fontSize);
  TextStyle italic() => copyWith(fontStyle: FontStyle.italic);
  TextStyle whiteText() => copyWith(color: SdColors.white);
}
