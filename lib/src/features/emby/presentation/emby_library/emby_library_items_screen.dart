

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:themby/src/common/constants.dart';
import 'package:themby/src/features/emby/data/view_repository.dart';
import 'package:themby/src/features/emby/presentation/emby_library/widgets/library_filter_tool.dart';
import 'package:themby/src/features/emby/presentation/emby_library/widgets/library_grid_items.dart';
import 'package:themby/src/features/emby/presentation/emby_library/widgets/sort_button.dart';

import 'emby_library_query_notifier.dart';

class EmbyLibraryItemsScreen extends ConsumerWidget{
  const EmbyLibraryItemsScreen({super.key,required this.title, required this.parentId, required this.filter,this.genreIds,});

  final String title;
  final String parentId;
  final String? genreIds;
  final String filter;

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final itemQuery = ref.watch(embyLibraryQueryNotifierProvider);

    final response = ref.watch(getItemProvider(
      itemQuery: (
        page: 0,
        parentId: parentId,
        genreIds: genreIds ?? '',
        includeItemTypes: itemQuery.includeItemTypes,
        sortBy: itemQuery.sortBy,
        sortOrder: itemQuery.sortOrder,
        filters: filter,
      ),
    ));

    final totalRecordCount = response.valueOrNull?.totalRecordCount;

    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          ref.invalidate(getItemProvider);
          ref.read(getItemProvider(
              itemQuery: (
              page: 0,
              parentId: parentId,
              genreIds: genreIds ?? '',
              includeItemTypes: itemQuery.includeItemTypes,
              sortBy: itemQuery.sortBy,
              sortOrder: itemQuery.sortOrder,
              filters: filter,
              )).future);
        },
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              centerTitle: true,
              title: Text(title,style:Theme.of(context).textTheme.titleMedium),
              floating: true,
              snap: true,
              pinned: true,
              scrolledUnderElevation: 0.0,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(38.0),
                child: Container(
                  margin: const EdgeInsets.only(top: 6,bottom: 12),
                  padding: const EdgeInsets.symmetric(horizontal: StyleString.safeSpace),
                  color: Theme.of(context).scaffoldBackgroundColor,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("${totalRecordCount ?? 0 } 项"),
                      const SortButton(),
                    ],
                  ),
                ),
              ),
            ),

            LibraryGridItems(parentId: parentId, filter: filter, genreIds: genreIds),
          ],
        ),
      ),
    );
  }

}