import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:themby/src/common/constants.dart';
import 'package:themby/src/features/emby/data/view_repository.dart';
import 'package:themby/src/features/emby/presentation/emby_library/emby_library_query_notifier.dart';
import 'package:themby/src/features/emby/presentation/emby_library/sort_button.dart';
import 'package:themby/src/features/emby/presentation/emby_library/sort_order_button.dart';
import 'package:themby/src/features/emby/presentation/widgets/media_card_v.dart';
import 'package:themby/src/helper/screen_helper.dart';


class EmbyLibraryScreen extends ConsumerWidget {
  const EmbyLibraryScreen({super.key, required this.parentId,required this.filter, required this.title});
  final String title;
  final String parentId;
  final String filter;

  static const pageSize = 30;

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

    double cardWidth = ScreenHelper.getPortionAuto()  * 1.2;
    double cardHeight = cardWidth / 0.68;

    return Scaffold(
      appBar: AppBar(
          scrolledUnderElevation: 0.0,
        centerTitle: true,
        title: Text(
            title,
            style: Theme.of(context).textTheme.titleMedium,
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(28),
          child: Container(
            margin: EdgeInsets.zero,
            padding: const EdgeInsets.symmetric(horizontal: StyleString.safeSpace),
            child: const Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // Text("共  部", style: TextStyle(color: Colors.white, fontSize: 12)),
                SortOrderButton(),
                SortButton()
              ],
            ),
          ),
        )
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          ref.invalidate(getItemProvider);
          ref.read(getItemProvider(
            itemQuery: (
              page: 0,
              parentId: parentId,
              includeItemTypes: itemQuery.includeItemTypes,
              sortBy: itemQuery.sortBy,
              sortOrder: itemQuery.sortOrder,
              filters: filter,
            )
          ).future);
        },
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(StyleString.safeSpace, 0, StyleString.safeSpace, 0),
              sliver: SliverGrid(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: cardWidth,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 13 / 22,
                ),
                delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                    final page = index ~/ pageSize;
                    final indexInPage = index % pageSize;

                    final responseAsync = ref.watch(
                        getItemProvider(
                            itemQuery: (
                              page: page,
                              parentId: parentId,
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
                          return null;
                        }
                        return MediaCardV(
                          item: response.items[indexInPage],
                          width: cardWidth,
                          height: cardHeight,
                        );
                      },
                      loading: () => const Center(child: CircularProgressIndicator()),
                      error: (error, stack) => Center(child: Text('Error: $error')),
                    );
                  },
                  childCount: totalRecordCount,
                ),
              ),
            ),
            // SliverGrid.builder(gridDelegate: gridDelegate, itemBuilder: itemBuilder)
          ],
        ),
      ),
    );
  }
}