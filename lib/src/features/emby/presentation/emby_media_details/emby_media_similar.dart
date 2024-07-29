

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:themby/src/features/emby/data/view_repository.dart';
import 'package:themby/src/features/emby/presentation/widgets/list_card_h.dart';

/// 相似推荐
class SimilarMedias extends ConsumerWidget{
  final String id;
  const SimilarMedias({super.key, required this.id});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(getSimilarProvider(id));
    return data.when(
      data: (data) => data.items.isNotEmpty ? ListCardsH(name: '相似推荐', items: data.items, showMore: false, parentId: '',) : const SizedBox(),
      loading: () => const SizedBox(),
      error: (error, stackTrace) => const SizedBox(),
    );
  }
}