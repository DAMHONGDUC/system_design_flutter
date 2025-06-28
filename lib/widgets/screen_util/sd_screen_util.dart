import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system_design_flutter/resources/resources.dart';

class SdScreenUtil extends StatelessWidget {
  const SdScreenUtil({super.key, this.child, this.builder});

  final Widget? child;
  final Widget Function(BuildContext, Widget?)? builder;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: SdConstants.designSize,
      minTextAdapt: true,
      splitScreenMode: true,
      fontSizeResolver: (fontSize, instance) {
        return instance.setWidth(fontSize);
      },
      child: child,
      builder: builder,
    );
  }
}
