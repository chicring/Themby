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
            selectedIcon: Icon(Icons.dns_rounded, color: Theme.of(context).primaryColor,),
            icon: Icon(Icons.dns_rounded),
            label: S.of(context).home,
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.person_rounded, color: Theme.of(context).primaryColor,),
            icon: Icon(Icons.person_rounded),
            label: S.of(context).mine,
          ),
        ],
      )
    );
  }
}

