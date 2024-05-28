import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../generated/l10n.dart';

class EmbyMain extends StatefulWidget {
  final StatefulNavigationShell child;

  const EmbyMain({super.key, required this.child});

  @override
  State<EmbyMain> createState() => _MainPageState();
}

class _MainPageState extends State<EmbyMain> {

  @override
  Widget build(BuildContext context) {

    var color = Theme.of(context).colorScheme.primary;
    var isLargeScreen = MediaQuery.of(context).size.width > 600;

    return isLargeScreen ? largeScreen(color) : smallScreen(color);
  }

  Widget smallScreen(Color color) {
    return Scaffold(
        body: SafeArea(
          child: widget.child,
        ),
        bottomNavigationBar: NavigationBar(
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          selectedIndex: widget.child.currentIndex,
          onDestinationSelected: (int index) {
            widget.child.goBranch(
              index,
              initialLocation: index == widget.child.currentIndex,
            );
            setState(() {});
          },
          destinations: [
            NavigationDestination(
              selectedIcon: Icon(Icons.video_library, color: color,),
              icon: const Icon(Icons.video_library),
              label: S.of(context).home,
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.search_rounded, color: color,),
              icon: const Icon(Icons.search_rounded),
              label: S.of(context).search,
            ),
          ],
        )
    );
  }

  Widget largeScreen(Color color){
    return Scaffold(
      body: Row(
        children: [
          NavigationRail(
            selectedIndex: widget.child.currentIndex,
            onDestinationSelected: (int index) {
              widget.child.goBranch(
                index,
                initialLocation: index == widget.child.currentIndex,
              );
              setState(() {});
            },
            labelType: NavigationRailLabelType.selected,
            destinations: [
              NavigationRailDestination(
                icon: const Icon(Icons.video_library),
                selectedIcon: Icon(Icons.video_library, color: color,),
                label: Text(S.of(context).home),
              ),
              NavigationRailDestination(
                icon: const Icon(Icons.search_rounded),
                selectedIcon: Icon(Icons.search_rounded, color: color,),
                label: Text(S.of(context).search),
              ),
            ],
          ),
          const VerticalDivider(thickness: 1, width: 1),
          Expanded(
            child: widget.child,
          )
        ],
      ),
    );
  }
}