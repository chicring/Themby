

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:themby/src/common/constants.dart';
import 'package:themby/src/features/emby/data/search_repository.dart';
import 'package:themby/src/features/emby/presentation/emby_search/widgets/search_text.dart';


class EmbySearchSuggests extends ConsumerWidget {
  const EmbySearchSuggests({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final RespAsync = ref.watch(getSearchRecommendProvider);

    return RespAsync.when(
        loading: () => const SizedBox(),
        error: (error, stack) => const SizedBox(),
        data: (data) {
          return Padding(
            padding: const EdgeInsets.all(StyleString.safeSpace),
            child: Wrap(
                alignment: WrapAlignment.center,
                spacing: 5,
                runSpacing: 5,
                children: [
                  ...data.items.map((item){
                    return SearchText(
                      searchText: item.name,
                      onSelect: (searchText) {
                        GoRouter.of(context).push('/details/${item.id}');
                      },
                    );
                  })
                ]
            ),
          );
        },
    );
  }
}