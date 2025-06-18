import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:system_design_flutter/utils/sd_router_hepler.dart';

class SdGoRoute extends GoRoute {
  SdGoRoute({
    required String path,
    required String name,
    required Widget Function(BuildContext, GoRouterState) builder,
    List<RouteBase> routes = const <RouteBase>[],
    GlobalKey<NavigatorState>? parentNavigatorKey,
    bool withSlideTransition = true,
  }) : super(
         path: path,
         name: name,
         builder: builder,
         pageBuilder: (context, state) {
           final child = builder(context, state);
           if (withSlideTransition) {
             return SdRouterHelper.buildSlideTransitionPage(
               child: child,
               state: state,
             );
           } else {
             return MaterialPage(key: state.pageKey, child: child);
           }
         },
         routes: routes,
         parentNavigatorKey: parentNavigatorKey,
       );
}
