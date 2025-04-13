import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';
import 'package:system_design_flutter/resources/resources.dart';
import 'package:system_design_flutter/index.dart';

class SdAppBarStory extends Story {
  SdAppBarStory({Key? key, required String name, required String description})
    : super(
        name: name,
        description: description,
        builder:
            (context) => SafeArea(
              child: Scaffold(
                backgroundColor: SdColors.white,
                appBar: SdAppBar(
                  title: 'app bar sample',
                  backgroundColor: SdColors.white,
                ),
                body: Center(child: Text('App Bar Sample')),
              ),
            ),
      );
}
