import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:themby/src/features/emby/data/view_repository.dart';

class LibraryFavoriteView extends ConsumerWidget{
  const LibraryFavoriteView({super.key, required this.parentId, required this.filter});

  final String parentId;
  final String filter;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final resp = ref.watch(
        getItemProvider(
            itemQuery: (
              page: 0,
              parentId: parentId,
              genreIds: '',
              includeItemTypes: 'Movie,Series',
              sortBy: 'SortName',
              sortOrder: 'Ascending',
              filters: 'IsFavorite',
            )
        )
    );

    return Container();
  }
}