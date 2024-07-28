

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:themby/src/features/emby/data/view_repository.dart';
import 'package:themby/src/features/emby/presentation/widget/list_cards_hh.dart';

class EmbyDetailsNextUp extends ConsumerWidget{
  const EmbyDetailsNextUp({super.key, required this.seriesId});

  final String seriesId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final respAsync = ref.watch(getNextUpProvider(seriesId));

    return respAsync.when(
      data: (data) {
        return data.items.isNotEmpty
        ? ListCardsHh(
          name: '继续观看',
          medias: data.items,
          onSelect: () {
          },
        )
            : const SizedBox();
      },
      loading: () {
        return const SizedBox();
      },
      error: (error, stack) {
        return const SizedBox();
      },
    );
  }
}