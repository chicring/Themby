
import 'package:flutter/material.dart';
import 'package:themby/src/common/widget/container_tab_indicator.dart';
import 'package:themby/src/extensions/constrains.dart';
import 'package:themby/src/features/emby/domain/tab_model.dart';

class LibraryBar extends StatelessWidget{
  const LibraryBar({super.key, required this.tabs, required this.ctr});

  final List<TabModel> tabs;
  final TabController ctr;

  @override
  Widget build(BuildContext context) {

    bool isLandscape = MediaQuery.of(context).mdAndUp;

    return TabBar(
      controller: ctr,
      tabAlignment: tabs.length > 4 ? TabAlignment.start : TabAlignment.center,
      dividerColor: Colors.transparent,
      enableFeedback: true,
      isScrollable: true,
      splashBorderRadius: BorderRadius.circular(6),
      padding: EdgeInsets.symmetric(horizontal: isLandscape ? 12 : 5),
      tabs: tabs.map((e) => Tab(text: e.name)).toList(),
        labelColor: isLandscape
            ? Theme.of(context).colorScheme.onSurface
            : Theme.of(context).colorScheme.primary,
        indicator: isLandscape
            ? ContainerTabIndicator(
            height: 36,
            radius: BorderRadius.circular(8.0),
            color: Theme.of(context).colorScheme.surfaceContainerHighest,
        )
            : null,
      onTap: (index) {
        if (!ctr.indexIsChanging) {
          // tap(index);
          // tabStateController.setTabIndex(index);
        }
      },
    );
  }
}