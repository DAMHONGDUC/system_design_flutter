import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';
import 'package:system_design_flutter/storybook/appbar/sd_appbar_story.dart';

void main() {
  runApp(MyApp());
}

String _appbarStory = 'Widgets/AppBar';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => Storybook(
        initialStory: _appbarStory,
        plugins: initializePlugins(
          initialDeviceFrameData: (
            isFrameVisible: true,
            device: Devices.ios.iPhone13,
            orientation: Orientation.portrait,
          ),
        ),
        stories: [
          SdAppBarStory(
            name: _appbarStory,
            description: 'app bar sample',
          ),
        ],
      );
}
