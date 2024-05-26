import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../generated/l10n.dart';

class MainPage extends StatefulWidget {
  const MainPage({
    super.key,
    required this.child,
  });

  final StatefulNavigationShell child;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

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
              selectedIcon: Icon(Icons.dns_rounded, color: color,),
              icon: Icon(Icons.dns_rounded),
              label: S.of(context).home,
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.person_rounded, color: color,),
              icon: Icon(Icons.person_rounded),
              label: S.of(context).mine,
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
                icon: Icon(Icons.dns_rounded),
                selectedIcon: Icon(Icons.dns_rounded, color: color,),
                label: Text(S.of(context).home),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.person_rounded),
                selectedIcon: Icon(Icons.person_rounded, color: color,),
                label: Text(S.of(context).mine),
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

