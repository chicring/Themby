import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:go_router/go_router.dart';
import 'package:themby/src/features/emby/domain/selected_media.dart';
import 'package:themby/src/features/emby/presentation/emby_favorite/emby_favorite_screen.dart';
import 'package:themby/src/features/emby/presentation/emby_home/emby_home_screen.dart';
import 'package:themby/src/features/emby/presentation/emby_library/emby_library_items_screen.dart';
import 'package:themby/src/features/emby/presentation/emby_library/emby_library_screen.dart';
import 'package:themby/src/features/emby/presentation/emby_media_details/emby_media_details.dart';
import 'package:themby/src/features/emby/presentation/emby_media_details/emby_season_details.dart';
import 'package:themby/src/features/emby/presentation/emby_search/emby_search_screen.dart';
import 'package:themby/src/features/home/presentation/home_screen.dart';
import 'package:themby/src/features/mine/presentation/about/about_screen.dart';
import 'package:themby/src/features/mine/presentation/mine/mine_screen.dart';
import 'package:themby/src/features/mine/presentation/mine_app_setting/cache_setting_screen.dart';
import 'package:themby/src/features/mine/presentation/mine_app_setting/mine_app_setting_screen.dart';
import 'package:themby/src/features/mine/presentation/mine_app_setting/setting_player__screen.dart';
import 'package:themby/src/features/mine/presentation/mine_app_setting/subtitle_setting_screen.dart';
import 'package:themby/src/features/mine/presentation/mine_app_setting/sync_setting_screen.dart';
import 'package:themby/src/features/player/presentation/player_screen.dart';
import 'package:themby/src/router/scaffold_with_nested_navigation_emby.dart';

enum AppRoute {
  home,
  mine,
  mineAppSetting,
  emby,
  favorite,
  library,
  libraryItems,
  details,
  season,
  player,
  search,
  about,
  playSetting,
  subtitleSetting,
  syncSetting,
  cacheSetting
}

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _homeNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'home');
final _libraryItemsNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'libraryItems');
final _embyNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'emby');
final _favoriteNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'favorite');

CustomTransitionPage buildPageWithDefaultTransition<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<T>(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) =>
        SlideTransition(
          position: animation.drive(
            Tween<Offset>(
              begin: const Offset(1, 0),
              end: Offset.zero,
            ).chain(
              CurveTween(curve: Curves.easeIn),
            ),
          ),
          child: child,
        )
  );
}

final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/home',
    navigatorKey: _rootNavigatorKey,
    debugLogDiagnostics: true,
    observers: [FlutterSmartDialog.observer],
    routes: [
      GoRoute(
        path: '/home',
        name: AppRoute.home.name,
        pageBuilder: (context, state) => NoTransitionPage(
          key: state.pageKey,
          child: const HomeScreen(),
        ),
      ),
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
      GoRoute(
        path: '/play_setting',
        name: AppRoute.playSetting.name,
        pageBuilder: (context, state) => NoTransitionPage(
          key: state.pageKey,
          child: const SettingPlayerScreen(),
        ),
      ),
      GoRoute(
        path: '/subtitle_setting',
        name: AppRoute.subtitleSetting.name,
        pageBuilder: (context, state) => NoTransitionPage(
          key: state.pageKey,
          child: const SubtitleSettingScreen(),
        ),
      ),
      GoRoute(
        path: '/sync_setting',
        name: AppRoute.syncSetting.name,
        pageBuilder: (context, state) => NoTransitionPage(
          key: state.pageKey,
          child: const SyncSettingScreen(),
        ),
      ),
      GoRoute(
        path: '/cache_setting',
        name: AppRoute.cacheSetting.name,
        pageBuilder: (context, state) => NoTransitionPage(
          key: state.pageKey,
          child: const CacheSettingScreen(),
        ),
      ),
      GoRoute(
        path: '/about',
        name: AppRoute.about.name,
        pageBuilder: (context, state) => NoTransitionPage(
          key: state.pageKey,
          child: const AboutScreen(),
        ),
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
                path: '/library',
                name: AppRoute.library.name,
                pageBuilder: (context, state) {

                  final parentId = state.uri.queryParameters['parentId']!;
                  final title = state.uri.queryParameters['title']!;
                  final filter = state.uri.queryParameters['filter']!;

                  return NoTransitionPage(
                    key: state.pageKey,
                    child: EmbyLibraryScreen(parentId: parentId, title: title,filter: filter),
                  );
                },
              ),
              GoRoute(
                path: '/libraryItems',
                name: AppRoute.libraryItems.name,
                pageBuilder: (context, state) {
                  final parentId = state.uri.queryParameters['parentId']!;
                  final genreIds = state.uri.queryParameters['genreIds'];
                  final title = state.uri.queryParameters['title']!;
                  final filter = state.uri.queryParameters['filter']!;
                  return NoTransitionPage(
                    key: state.pageKey,
                    child: EmbyLibraryItemsScreen(parentId: parentId, title: title,filter: filter,genreIds: genreIds),
                  );
                },
              ),
              GoRoute(
                path: '/emby/search',
                name: AppRoute.search.name,
                pageBuilder: (context, state) => NoTransitionPage(
                  key: state.pageKey,
                  child: const EmbySearchScreen(),
                )
              )
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
        path: '/player',
        name: AppRoute.player.name,
        pageBuilder: (context, state) {

          SelectedMedia select = state.extra as SelectedMedia;
          return NoTransitionPage(
            key: state.pageKey,
            child: PlayerScreen(
              media: select,
            ),
          );
        }
      )

    ],
  );
});