import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system_design_flutter/resources/resources.dart';

abstract class SdBaseTextStyle {
  static TextStyle base({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
    String? fontFamily,
  }) {
    return TextStyle(
      fontSize: fontSize ?? 10.sp,
      fontWeight: fontWeight ?? FontWeight.w400,
      color: color ?? SdColors.black,
    );
  }
}

class SdTextStyle extends SdBaseTextStyle {
  SdTextStyle._();

  // Body styles (regular weight)
  static TextStyle body6() => SdBaseTextStyle.base().wSize(6.sp);
  static TextStyle body8() => SdBaseTextStyle.base().wSize(8.sp);
  static TextStyle body9() => SdBaseTextStyle.base().wSize(9.sp);
  static TextStyle body10() => SdBaseTextStyle.base().wSize(10.sp);
  static TextStyle body12() => SdBaseTextStyle.base().wSize(12.sp);
  static TextStyle body14() => SdBaseTextStyle.base().wSize(14.sp);
  static TextStyle body16() => SdBaseTextStyle.base().wSize(16.sp);
  static TextStyle body18() => SdBaseTextStyle.base().wSize(18.sp);
  static TextStyle body20() => SdBaseTextStyle.base().wSize(20.sp);
  static TextStyle body24() => SdBaseTextStyle.base().wSize(24.sp);
  static TextStyle body32() => SdBaseTextStyle.base().wSize(32.sp);
  static TextStyle body40() => SdBaseTextStyle.base().wSize(40.sp);
  static TextStyle body48() => SdBaseTextStyle.base().wSize(48.sp);
  static TextStyle body56() => SdBaseTextStyle.base().wSize(56.sp);
  static TextStyle body64() => SdBaseTextStyle.base().wSize(64.sp);
  static TextStyle body72() => SdBaseTextStyle.base().wSize(72.sp);

  // Heading styles (semi-bold)
  static TextStyle heading6() => SdBaseTextStyle.base().wSemiBold().wSize(6.sp);
  static TextStyle heading8() => SdBaseTextStyle.base().wSemiBold().wSize(8.sp);
  static TextStyle heading9() => SdBaseTextStyle.base().wSemiBold().wSize(9.sp);
  static TextStyle heading10() =>
      SdBaseTextStyle.base().wSemiBold().wSize(10.sp);
  static TextStyle heading12() =>
      SdBaseTextStyle.base().wSemiBold().wSize(12.sp);
  static TextStyle heading13() =>
      SdBaseTextStyle.base().wSemiBold().wSize(13.sp);
  static TextStyle heading14() =>
      SdBaseTextStyle.base().wSemiBold().wSize(14.sp);
  static TextStyle heading16() =>
      SdBaseTextStyle.base().wSemiBold().wSize(16.sp);
  static TextStyle heading18() =>
      SdBaseTextStyle.base().wSemiBold().wSize(18.sp);
  static TextStyle heading20() =>
      SdBaseTextStyle.base().wSemiBold().wSize(20.sp);
  static TextStyle heading24() =>
      SdBaseTextStyle.base().wSemiBold().wSize(24.sp);
  static TextStyle heading28() =>
      SdBaseTextStyle.base().wSemiBold().wSize(28.sp);
  static TextStyle heading32() =>
      SdBaseTextStyle.base().wSemiBold().wSize(32.sp);
  static TextStyle heading40() =>
      SdBaseTextStyle.base().wSemiBold().wSize(40.sp);
  static TextStyle heading48() =>
      SdBaseTextStyle.base().wSemiBold().wSize(48.sp);
  static TextStyle heading56() =>
      SdBaseTextStyle.base().wSemiBold().wSize(56.sp);
  static TextStyle heading64() =>
      SdBaseTextStyle.base().wSemiBold().wSize(64.sp);
  static TextStyle heading72() =>
      SdBaseTextStyle.base().wSemiBold().wSize(72.sp);
}

extension TextStyleExt on TextStyle {
  TextStyle wLight() => copyWith(fontWeight: FontWeight.w300);
  TextStyle wRegular() => copyWith(fontWeight: FontWeight.w400);
  TextStyle wMedium() => copyWith(fontWeight: FontWeight.w500);
  TextStyle wSemiBold() => copyWith(fontWeight: FontWeight.w600);
  TextStyle wBold() => copyWith(fontWeight: FontWeight.w700);
  TextStyle wColor(Color color) => copyWith(color: color);
  TextStyle wSize(double fontSize) => copyWith(fontSize: fontSize);
  TextStyle wFontFamily(String fontFamily) => copyWith(fontFamily: fontFamily);
  TextStyle wItalic() => copyWith(fontStyle: FontStyle.italic);
  TextStyle whiteText() => copyWith(color: SdColors.white);
}
