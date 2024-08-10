

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:themby/src/common/constants.dart';
import 'package:themby/src/features/emby/data/view_repository.dart';
import 'package:themby/src/features/emby/presentation/emby_library/emby_library_query_notifier.dart';
import 'package:themby/src/features/emby/presentation/emby_library/widgets/sort_button.dart';


class LibraryFilterTool extends ConsumerWidget{
  const LibraryFilterTool({super.key, required this.parentId,required this.filter});

  final String parentId;
  final String filter;

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final itemQuery = ref.watch(embyLibraryQueryNotifierProvider);

    final response = ref.watch(getItemProvider(
      itemQuery: (
      page: 0,
      parentId: parentId,
      includeItemTypes: itemQuery.includeItemTypes,
      sortBy: itemQuery.sortBy,
      sortOrder: itemQuery.sortOrder,
      filters: filter,
      ),
    ));

    final totalRecordCount = response.valueOrNull?.totalRecordCount;

    return SliverPersistentHeader(
      pinned: true,
      delegate: FixedHeaderDelegate(
        minExtent: 24.0,
        maxExtent: 36.0,
        totalRecordCount: totalRecordCount ?? 0,
      ),
    );
  }
}

class FixedHeaderDelegate extends SliverPersistentHeaderDelegate {
  @override
  final double minExtent;
  @override
  final double maxExtent;
  final int totalRecordCount;

  FixedHeaderDelegate({
    required this.minExtent,
    required this.maxExtent,
    required this.totalRecordCount,
  });

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      margin: const EdgeInsets.only(top: 6,bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: StyleString.safeSpace),
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("$totalRecordCount 项"),
          const SortButton(),
        ],
      ),
    );
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}