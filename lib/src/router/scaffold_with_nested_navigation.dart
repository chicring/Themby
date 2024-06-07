import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:themby/src/localization/string_hardcoded.dart';


class ScaffoldWithNestedNavigation extends StatelessWidget {
  const ScaffoldWithNestedNavigation({
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
    if (size.width < 450) {

      return BackButtonListener(
          onBackButtonPressed: () async {
            final routeName = navigationShell.shellRouteContext.routerState.uri.toString();
            if (routeName == '/mine') {
              _goBranch(0);
              return true;
            }
            return false;
          },
          child: ScaffoldWithNavigationBar(
            body: navigationShell,
            currentIndex: navigationShell.currentIndex,
            onDestinationSelected: _goBranch,
          )
      );

    } else {
      return ScaffoldWithNavigationRail(
        body: navigationShell,
        currentIndex: navigationShell.currentIndex,
        onDestinationSelected: _goBranch,
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
            selectedIcon: Icon(Icons.dns_rounded, color: Theme.of(context).colorScheme.primary),
            icon: const Icon(Icons.dns_outlined),
            label: 'Home'.hardcoded,
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.account_circle_rounded, color: Theme.of(context).colorScheme.primary),
            icon: const Icon(Icons.account_circle_outlined),
            label: 'mine'.hardcoded,
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
                selectedIcon: Icon(Icons.dns_rounded, color: Theme.of(context).colorScheme.primary),
                icon: const Icon(Icons.dns_outlined),
                label: Text('Home'.hardcoded),
              ),
              NavigationRailDestination(
                selectedIcon: Icon(Icons.account_circle_rounded, color: Theme.of(context).colorScheme.primary),
                icon: const Icon(Icons.account_circle_outlined),
                label: Text('mine'.hardcoded),
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
