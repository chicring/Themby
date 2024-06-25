import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:go_router/go_router.dart';
import 'package:themby/src/features/emby/presentation/emby_favorite/emby_favorite_screen.dart';
import 'package:themby/src/features/emby/presentation/emby_home/emby_home_screen.dart';
import 'package:themby/src/features/emby/presentation/emby_library/emby_library_screen.dart';
import 'package:themby/src/features/emby/presentation/emby_media_details/emby_media_details.dart';
import 'package:themby/src/features/emby/presentation/emby_media_details/emby_season_details.dart';
import 'package:themby/src/features/home/presentation/home_screen.dart';
import 'package:themby/src/features/mine/presentation/mine/mine_screen.dart';
import 'package:themby/src/features/mine/presentation/mine_app_setting/mine_app_setting_screen.dart';
import 'package:themby/src/features/player/presentation/horizontal_player.dart';
import 'package:themby/src/features/player/presentation/player_screen.dart';
import 'package:themby/src/router/scaffold_with_nested_navigation.dart';
import 'package:themby/src/router/scaffold_with_nested_navigation_emby.dart';

enum AppRoute {
  home,
  mine,
  mineAppSetting,
  emby,
  favorite,
  library,
  details,
  season,
  player
}

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _homeNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'home');
final _mineNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'mine');
final _embyNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'emby');
final _favoriteNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'favorite');


final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/home',
    navigatorKey: _rootNavigatorKey,
    debugLogDiagnostics: true,
    observers: [FlutterSmartDialog.observer],
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return ScaffoldWithNestedNavigation(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            navigatorKey: _homeNavigatorKey,
            routes: [
              GoRoute(
                path: '/home',
                name: AppRoute.home.name,
                pageBuilder: (context, state) => NoTransitionPage(
                  key: state.pageKey,
                  child: const HomeScreen(),
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _mineNavigatorKey,
            routes: [
              GoRoute(
                path: '/mine',
                name: AppRoute.mine.name,
                pageBuilder: (context, state) => NoTransitionPage(
                  key: state.pageKey,
                  child: const MineScreen(),
                ),
              ),
              GoRoute(
                path: '/app_setting',
                name: AppRoute.mineAppSetting.name,
                pageBuilder: (context, state) => NoTransitionPage(
                  key: state.pageKey,
                  child: const MineAppSettingScreen(),
                ),
              ),
            ],
          ),
        ],
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return ScaffoldWithNestedNavigationEmby(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            navigatorKey: _embyNavigatorKey,
            routes: [
              GoRoute(
                path: '/emby',
                name: AppRoute.emby.name,
                pageBuilder: (context, state) => NoTransitionPage(
                  key: state.pageKey,
                  child: const EmbyHomeScreen(),
                ),
              ),
              GoRoute(
                path: '/library/:parentId',
                name: AppRoute.library.name,
                pageBuilder: (context, state) {
                  final parentId = state.pathParameters['parentId']!;

                  final title = state.uri.queryParameters['title']!;

                  return NoTransitionPage(
                    key: state.pageKey,
                    child: EmbyLibraryScreen(parentId: parentId, title: title),
                  );
                },
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _favoriteNavigatorKey,
            routes: [
              GoRoute(
                path: '/favorite',
                name: AppRoute.favorite.name,
                pageBuilder: (context, state) => NoTransitionPage(
                  key: state.pageKey,
                  child: const EmbyFavoriteScreen(),
                ),
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        path: '/details/:id',
        name: AppRoute.details.name,
        pageBuilder: (context, state) {
          final id = state.pathParameters['id']!;
          return NoTransitionPage(
            key: state.pageKey,
            child: EmbyMediaDetails(id: id),
          );
        },
      ),
      GoRoute(
        path: '/season/:id',
        name: AppRoute.season.name,
        pageBuilder: (context, state) {
          final id = state.pathParameters['id']!;
          return NoTransitionPage(
            key: state.pageKey,
            child: EmbySeasonDetails(id),
          );
        },
      ),
      GoRoute(
        path: '/player/:type/:id',
        name: AppRoute.player.name,
        pageBuilder: (context, state) {
          final id = state.pathParameters['id']!;
          final type = state.pathParameters['type']!;
          return NoTransitionPage(
            key: state.pageKey,
            child: PlayerScreen(
              id: id,
              type: type,
            ),
          );
        }
      )

    ],
  );
});