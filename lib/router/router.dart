import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:go_router/go_router.dart';

import '../page/appearance/view.dart';
import '../page/home/view.dart';
import '../page/mine/view.dart';
import '../page/main/view.dart';


class CustomNavigationHelper {
  static final CustomNavigationHelper _instance = CustomNavigationHelper._internal();

  static CustomNavigationHelper get instance => _instance;

  static late final GoRouter router;

  factory CustomNavigationHelper() {
    return _instance;
  }

  static const String homePath = '/home';
  static const String minePath = '/mine';
  static const String appearancePath = '/appearance';

  static final GlobalKey<NavigatorState> mainKey = GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> homeNavigatorKey = GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> mineNavigatorKey = GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> appearanceNavigatorKey = GlobalKey<NavigatorState>();

  BuildContext get context => router.routerDelegate.navigatorKey.currentContext!;

  GoRouterDelegate get routerDelegate => router.routerDelegate;

  GoRouteInformationParser get routeInformationParser => router.routeInformationParser;

  CustomNavigationHelper._internal() {
    final routes = [
      StatefulShellRoute.indexedStack(
          parentNavigatorKey: mainKey,
          branches: [
            StatefulShellBranch(
              navigatorKey: homeNavigatorKey,
              routes: [
                GoRoute(
                  path: homePath,
                  pageBuilder: (context, GoRouterState state) {
                    return getPage(
                      child: const HomePage(),
                      state: state,
                    );
                  },
                ),
              ],
            ),
            StatefulShellBranch(
              navigatorKey: mineNavigatorKey,
              routes: [
                GoRoute(
                  path: minePath,
                  pageBuilder: (context, GoRouterState state) {
                    return getPage(
                      child: const MinePage(),
                      state: state,
                    );
                  },
                ),
                GoRoute(
                  path: appearancePath,
                  pageBuilder: (context, GoRouterState state) {
                    return getPage(
                      child: AppearancePage(),
                      state: state,
                    );
                  },
                ),
              ],
            ),
            // StatefulShellBranch(
            //   navigatorKey: appearanceNavigatorKey,
            //   routes: [
            //     GoRoute(
            //       path: appearancePath,
            //       pageBuilder: (context, GoRouterState state) {
            //         return getPage(
            //           child: AppearanceWidget(),
            //           state: state,
            //         );
            //       },
            //     ),
            //   ],
            // )
          ],
          pageBuilder: (
              BuildContext context,
              GoRouterState state,
              StatefulNavigationShell navigationShell,
          ){
            return getPage(
              child: MainPage(
                child: navigationShell,
              ),
              state: state,
            );
          }

      )
    ];

    router = GoRouter(
      //smartDialog
      observers: [FlutterSmartDialog.observer],
      navigatorKey: mainKey,
      initialLocation: homePath,
      routes: routes,
    );
  }

  static Page getPage({
    required Widget child,
    required GoRouterState state,
  }) {
    return MaterialPage(
      key: state.pageKey,
      child: child,
    );
  }
}
