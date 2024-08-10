import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:themby/src/common/widget/container_tab_indicator.dart';
import 'package:themby/src/extensions/constrains.dart';
import 'package:themby/src/features/emby/presentation/emby_library/tab_views/library_all_view.dart';
import 'package:themby/src/features/emby/presentation/emby_library/tab_views/library_collection_view.dart';
import 'package:themby/src/features/emby/presentation/emby_library/tab_views/library_favorite_view.dart';
import 'package:themby/src/features/emby/presentation/emby_library/tab_views/library_folder_view.dart';
import 'package:themby/src/features/emby/presentation/emby_library/tab_views/library_genre_view.dart';
import 'package:themby/src/features/emby/presentation/emby_library/tab_views/library_recent_view.dart';
import 'package:themby/src/features/emby/presentation/emby_library/tab_views/library_tag_view.dart';

import 'item_bars.dart';


class EmbyLibraryScreen extends ConsumerStatefulWidget{
  const EmbyLibraryScreen({super.key, required this.parentId,required this.filter, required this.title});
  final String title;
  final String parentId;
  final String filter;

  @override
  ConsumerState<EmbyLibraryScreen> createState() => _EmbyLibraryScreen();
}

class _EmbyLibraryScreen extends ConsumerState<EmbyLibraryScreen>  with AutomaticKeepAliveClientMixin, TickerProviderStateMixin {

  late final TabController _tabController = TabController(vsync: this, length: tabs.length);


  @override
  Widget build(BuildContext context) {
    super.build(context);

    bool isLandscape = MediaQuery.of(context).mdAndUp;

    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) => <Widget>[
          SliverAppBar(
            pinned: true,
            floating: true,
            title: Text(widget.title, style: Theme.of(context).textTheme.titleMedium),
            centerTitle: true,
            scrolledUnderElevation: 0.0,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            bottom: TabBar(
              controller: _tabController,
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
                radius: BorderRadius.circular(8.0),
                color: Theme.of(context).colorScheme.surfaceContainerHighest,
              )
                  : null,
              onTap: (index) {
                if (!_tabController.indexIsChanging) {
                  // tap(index);
                  // tabStateController.setTabIndex(index);
                }
              },
            ),
          ),
        ],
        body: TabBarView(
          controller: _tabController,
          children: [
            LibraryAllView(parentId: widget.parentId, filter: widget.filter),
            LibraryRecentView(parentId: widget.parentId, filter: widget.filter),
            LibraryCollectionView(parentId: widget.parentId, filter: widget.filter),
            LibraryGenreView(parentId: widget.parentId, filter: widget.filter),
            LibraryTagView(parentId: widget.parentId, filter: widget.filter),
            LibraryFavoriteView(parentId: widget.parentId, filter: widget.filter),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}



