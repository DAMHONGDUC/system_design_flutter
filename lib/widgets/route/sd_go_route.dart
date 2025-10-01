import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:system_design_flutter/utils/sd_router_hepler.dart';

class SdGoRoute extends GoRoute {
  SdGoRoute({
    required super.path,
    required String super.name,
    required Widget Function(BuildContext, GoRouterState) super.builder,
    super.routes,
    super.parentNavigatorKey,
    bool withSlideTransition = true,
  }) : super(
         pageBuilder: (context, state) {
           final child = builder(context, state);
           if (withSlideTransition && Platform.isAndroid) {
             return SdRouterHelper.buildSlideTransitionPage(
               child: child,
               state: state,
             );
           } else {
             return MaterialPage(key: state.pageKey, child: child);
           }
         },
       );
}
