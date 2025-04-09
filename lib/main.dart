import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:storybook_flutter/storybook_flutter.dart';
import 'package:system_design_flutter/resources/resources.dart';
import 'package:system_design_flutter/storybook/appbar/sd_appbar_story.dart';
import 'package:system_design_flutter/theme/theme.dart';

void main() async {
  final savedThemeMode = await AdaptiveTheme.getThemeMode();
  runApp(MyApp(savedThemeMode: savedThemeMode));
}

String _appbarStory = 'Widgets/AppBar';

class MyApp extends StatelessWidget {
  const MyApp({super.key, this.savedThemeMode});
  final AdaptiveThemeMode? savedThemeMode;

  @override
  Widget build(BuildContext context) => Storybook(
    wrapperBuilder: (context, child) => materialWrapper(child, savedThemeMode),
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

Widget materialWrapper(Widget? child, AdaptiveThemeMode? savedThemeMode) {
  return AdaptiveTheme(
    light: CustomTheme.lightTheme(fontFamily: SdConstants.sdFontFamily),
    dark: CustomTheme.darkTheme(fontFamily: SdConstants.sdFontFamily),
    initial: savedThemeMode ?? AdaptiveThemeMode.system,
    builder:
        (theme, darkTheme) => ScreenUtilInit(
          fontSizeResolver: (num fontSize, ScreenUtil instance) {
            return instance.setWidth(fontSize);
          },
          designSize: SdConstants.designSize,
          minTextAdapt: true,
          splitScreenMode: true,
          child: MaterialApp(
            theme: theme,
            darkTheme: darkTheme,
            debugShowCheckedModeBanner: false,
            home: Scaffold(body: Center(child: child)),
          ),
        ),
  );
}
