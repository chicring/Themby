
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:themby/src/common/constants.dart';
import 'package:themby/src/common/widget/dynamic_height_grid_view.dart';
import 'package:themby/src/extensions/constrains.dart';
import 'package:themby/src/features/emby/data/view_repository.dart';
import 'package:themby/src/features/emby/presentation/emby_library/emby_library_query_notifier.dart';
import 'package:themby/src/features/emby/presentation/widgets/media_card_v.dart';
import 'package:themby/src/features/emby/presentation/widgets/skeleton/media_card_v_skeleton.dart';

class LibraryGridItems extends ConsumerWidget {
  const LibraryGridItems({super.key,required this.parentId,required this.filter,this.genreIds});

  final String parentId;
  final String? genreIds;
  final String filter;

  static const pageSize = 30;

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

    final mediaQuery = MediaQuery.of(context);

    return SliverPadding(
      padding: const EdgeInsets.fromLTRB(StyleString.safeSpace, 0, StyleString.safeSpace, 0),
      sliver: SliverDynamicHeightGridView(
        crossAxisCount: mediaQuery.smAndDown ? 3 : 8,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        builder: (BuildContext context, int index) {
          final page = index ~/ pageSize;
          final indexInPage = index % pageSize;
          final responseAsync = ref.watch(
              getItemProvider(
                  itemQuery: (
                  page: page,
                  parentId: parentId,
                  genreIds: genreIds ?? '',
                  includeItemTypes: itemQuery.includeItemTypes,
                  sortBy: itemQuery.sortBy,
                  sortOrder: itemQuery.sortOrder,
                  filters: filter,
                  )
              )
          );
          return responseAsync.when(
            data: (response) {
              if (response.items.length <= indexInPage) {
                return const SizedBox();
              }
              return LayoutBuilder(builder: (context, boxConstraints){
                return MediaCardV(
                  item: response.items[indexInPage],
                  width: boxConstraints.maxWidth,
                  height: boxConstraints.maxWidth / 0.68,
                );
              });

            },
            loading: () => LayoutBuilder(builder: (context, boxConstraints){
              return MediaCardVSkeleton(
                width: boxConstraints.maxWidth,
                height: boxConstraints.maxWidth / 0.68,
              );
            }),
            error: (error, stack) => Center(child: Text('Error: $error')),
          );
        },
        itemCount: totalRecordCount ?? 8,
      ),

    );
  }
}