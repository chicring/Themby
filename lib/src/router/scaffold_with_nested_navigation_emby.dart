import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:themby/src/localization/string_hardcoded.dart';


class ScaffoldWithNestedNavigationEmby extends StatelessWidget {
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
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    backButtonListener(Widget child) => BackButtonListener(
      onBackButtonPressed: () async {
        if (navigationShell.currentIndex == 1) {
          _goBranch(0);
          return true;
        } else if (navigationShell.currentIndex == 0) {
          GoRouter.of(context).go('/home');
          return true;
        }
        return false;
      },
      child: child,
    );

    if (size.width < 450) {
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
        selectedIndex: currentIndex,
        destinations: [
          NavigationDestination(
            icon: const Icon(Icons.video_library),
            label: 'library'.hardcoded,
          ),
          NavigationDestination(
            icon: const Icon(Icons.favorite),
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
