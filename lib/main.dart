import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:storybook_flutter/storybook_flutter.dart';
import 'package:system_design_flutter/resources/resources.dart';
import 'package:system_design_flutter/storybook/appbar/sd_appbar_story.dart';
import 'package:system_design_flutter/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

String _appbarStory = 'Widgets/AppBar';

Widget materialWrapper(Widget? child) {
  return ScreenUtilInit(
    fontSizeResolver: (num fontSize, ScreenUtil instance) {
      return kIsWeb
          ? fontSize * 1.1944444444444444
          : instance.setWidth(fontSize);
    },
    designSize: SdConstants.designSize,
    minTextAdapt: true,
    splitScreenMode: true,
    child: MaterialApp(
      theme: SdTheme.light(fontFamily: SdConstants.sdFontFamily),
      darkTheme: SdTheme.dark(fontFamily: SdConstants.sdFontFamily),
      themeMode:
          ThemeMode.system, // Optional: switch to .light or .dark if needed
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: Center(child: child)),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => Storybook(
    wrapperBuilder: (context, child) => materialWrapper(child),
    initialStory: _appbarStory,
    plugins: initializePlugins(
      initialDeviceFrameData: (
        isFrameVisible: true,
        device: Devices.ios.iPhone13,
        orientation: Orientation.portrait,
      ),
    ),
    stories: [SdAppBarStory(name: _appbarStory, description: 'app bar sample')],
  );
}
