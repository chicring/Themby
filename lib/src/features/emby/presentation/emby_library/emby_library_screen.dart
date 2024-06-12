import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:themby/src/common/constants.dart';
import 'package:themby/src/features/emby/data/view_repository.dart';
import 'package:themby/src/features/emby/presentation/emby_library/emby_library_query_notifier.dart';
import 'package:themby/src/features/emby/presentation/widget/media_card_v.dart';

class EmbyLibraryScreen extends ConsumerWidget {
  const EmbyLibraryScreen({super.key, required this.parentId, required this.title});
  final String title;
  final String parentId;

  static const pageSize = 30;

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final itemQuery = ref.watch(embyLibraryQueryNotifierProvider);

    final response = ref.watch(getItemProvider(
      itemQuery: itemQuery,
    ));

    final totalRecordCount = response.valueOrNull?.totalRecordCount;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
            title,
            style: Theme.of(context).textTheme.titleMedium,
        ),
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
            )
          ).future);
        },
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(StyleString.safeSpace, 0, StyleString.safeSpace, 0),
              sliver: SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: StyleString.cardSpace - 2,
                  crossAxisSpacing: StyleString.cardSpace,
                  crossAxisCount: 3,
                  mainAxisExtent: MediaQuery.of(context).size.width / 3 / 0.65 +
                      MediaQuery.textScalerOf(context).scale(40),
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
                            )
                        )
                    );
                    return responseAsync.when(
                      data: (response) {
                        if (response.items.length <= indexInPage) {
                          return null;
                        }
                        return MediaCardV(
                          media: response.items[indexInPage],
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
          ],
        ),
      ),
    );
  }
}