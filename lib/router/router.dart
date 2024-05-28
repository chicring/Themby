import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:go_router/go_router.dart';
import 'package:themby/page/emby/emby_main/view.dart';

import '../page/appearance/view.dart';
import '../page/emby/emby_home/view.dart';
import '../page/emby/emby_search/view.dart';
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

  static const String embyHomePath = '/embyHome';
  static const String embySearchPath = '/embySearch';


  static final GlobalKey<NavigatorState> mainKey = GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> homeNavigatorKey = GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> mineNavigatorKey = GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> appearanceNavigatorKey = GlobalKey<NavigatorState>();

  static final GlobalKey<NavigatorState> embyMainNavigatorKey = GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> embyHomeNavigatorKey = GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> embySearchNavigatorKey = GlobalKey<NavigatorState>();


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
                      child: const AppearancePage(),
                      state: state,
                    );
                  },
                ),
              ],
            ),
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
      ),
      StatefulShellRoute.indexedStack(
          parentNavigatorKey: mainKey,
          branches: [
            StatefulShellBranch(
              navigatorKey: embyHomeNavigatorKey,
              routes: [
                GoRoute(
                  path: embyHomePath,
                  pageBuilder: (context, GoRouterState state) {
                    return getPage(
                      child: const EmbyHome(),
                      state: state,
                    );
                  },
                ),
              ],
            ),
            StatefulShellBranch(
              navigatorKey: embySearchNavigatorKey,
              routes: [
                GoRoute(
                  path: embySearchPath,
                  pageBuilder: (context, GoRouterState state) {
                    return getPage(
                      child: const EmbySearch(),
                      state: state,
                    );
                  },
                ),
              ],
            ),
          ],
          pageBuilder: (
              BuildContext context,
              GoRouterState state,
              StatefulNavigationShell navigationShell,
          ){
            return getPage(
              child: EmbyMain(
                child: navigationShell,
              ),
              state: state,
            );
          }
      ),
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
    return CustomTransitionPage(
      key: state.pageKey,
      child: child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity:
            CurveTween(curve: Curves.easeInOut).animate(animation),
          child: child,
        );
      },
    );
  }
}
