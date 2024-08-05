import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:themby/src/features/emby/data/view_repository.dart';
import 'package:themby/src/localization/string_hardcoded.dart';


class ScaffoldWithNestedNavigationEmby extends ConsumerWidget {
  const ScaffoldWithNestedNavigationEmby({
    Key? key,
    required this.navigationShell,
  }) : super(key: key ?? const ValueKey('ScaffoldWithNestedNavigation'));
  final StatefulNavigationShell navigationShell;

  void _goBranch(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.sizeOf(context);

    backButtonListener(Widget child) => BackButtonListener(
      onBackButtonPressed: () async {
        int currentIndex = navigationShell.currentIndex;

        final currentPath = GoRouter.of(context).routerDelegate.currentConfiguration.last.route.path;

        if (currentPath.startsWith('/details/')) {
          ref.refresh(getResumeMediaProvider());
          return false;
        }

        if (currentPath.startsWith('/season/') || currentPath.startsWith('/player') ) {
          return false;
        }

        if (currentIndex == 1) {
          if(currentPath.startsWith('/library')) {
            return false;
          }
          _goBranch(0);
          return true;
        } else if (currentIndex == 0) {
          final routeName = navigationShell.shellRouteContext.routerState.uri.toString();
          if (routeName == '/emby') {
            GoRouter.of(context).go('/home');
            return true;
          }
          return false;
        }
        return false;
      },
      child: child,
    );

    if (size.width < 550) {
      return backButtonListener(
        ScaffoldWithNavigationBar(
          body: navigationShell,
          currentIndex: navigationShell.currentIndex,
          onDestinationSelected: _goBranch,
        ),
      );
    } else {
      return backButtonListener(
        ScaffoldWithNavigationRail(
          body: navigationShell,
          currentIndex: navigationShell.currentIndex,
          onDestinationSelected: _goBranch,
        ),
      );
    }
  }
}


class ScaffoldWithNavigationBar extends StatelessWidget {
  const ScaffoldWithNavigationBar({
    super.key,
    required this.body,
    required this.currentIndex,
    required this.onDestinationSelected,
  });
  final Widget body;
  final int currentIndex;
  final ValueChanged<int> onDestinationSelected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body,
      bottomNavigationBar: NavigationBar(
        height: 64,
        selectedIndex: currentIndex,
        destinations: [
          NavigationDestination(
            selectedIcon: Icon(Icons.video_library, color: Theme.of(context).colorScheme.primary),
            icon: const Icon(Icons.video_library),
            label: 'library'.hardcoded,
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.favorite_rounded, color: Theme.of(context).colorScheme.primary),
            icon: const Icon(Icons.favorite_border_rounded),
            label: 'favorite'.hardcoded,
          ),
        ],
        onDestinationSelected: onDestinationSelected,
      ),
    );
  }
}

class ScaffoldWithNavigationRail extends StatelessWidget {
  const ScaffoldWithNavigationRail({
    super.key,
    required this.body,
    required this.currentIndex,
    required this.onDestinationSelected,
  });
  final Widget body;
  final int currentIndex;
  final ValueChanged<int> onDestinationSelected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          NavigationRail(
            selectedIndex: currentIndex,
            onDestinationSelected: onDestinationSelected,
            labelType: NavigationRailLabelType.all,
            destinations: <NavigationRailDestination>[
              NavigationRailDestination(
                icon: const Icon(Icons.video_library),
                label: Text('library'.hardcoded),
              ),
              NavigationRailDestination(
                icon: const Icon(Icons.favorite),
                label: Text('favorite'.hardcoded),
              ),
            ],
          ),
          const VerticalDivider(thickness: 1, width: 1),
          // This is the main content.
          Expanded(
            child: body,
          ),
        ],
      ),
    );
  }
}
