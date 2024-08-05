

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:themby/src/features/emby/data/view_repository.dart';
import 'package:themby/src/features/emby/presentation/widgets/list_card_h.dart';



class EmbyFavoriteItem extends ConsumerWidget {

  final String type;

  const EmbyFavoriteItem({super.key, required this.type});


  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final resp = ref.watch(
        getItemProvider(
            itemQuery: (
              page: 0,
              parentId: '',
              includeItemTypes: type == 'movie' ? 'Movie' : 'Series',
              sortBy: 'SortName',
              sortOrder: 'Ascending',
              filters: 'IsFavorite',
            )
        )
    );

    return resp.when(
        loading: () => const SizedBox(),
        error: (error, stack) => const SizedBox(),
        data: (data) {

          return data.items.isEmpty ?
            const SizedBox()
              : ListCardsH(
              name: type == 'movie' ? '喜欢的电影' : '喜欢的剧集',
              parentId: '',
              items: data.items,
              onSelect: () {
                GoRouter.of(context).push(Uri(path: '/library', queryParameters: {'parentId': '','title': '我的收藏','filter': 'IsFavorite'}).toString());
              },
          );
        }
    );
  }
}