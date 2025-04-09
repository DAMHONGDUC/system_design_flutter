import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';
import 'package:system_design_flutter/system_design_flutter.dart';

class SdAppBarStory extends Story {
  SdAppBarStory({Key? key, required String name, required String description})
    : super(
        name: name,
        description: description,
        builder:
            (context) => SafeArea(
              child: Scaffold(
                // appBar: SdAppBar(title: 'app bar sample'),
                body: Center(child: Text('App Bar Sample')),
              ),
            ),
      );
}
