

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:themby/src/features/emby/data/view_repository.dart';

import 'package:themby/src/features/emby/presentation/widgets/list_season_card_h.dart';

class EmbyDetailSeason extends ConsumerWidget {
  final String id;
  const EmbyDetailSeason({super.key, required this.id});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(getSeasonsProvider(id));

    return data.when(
      data: (data) => data.isNotEmpty ? ListSeasonCardH(name: '季', items: data) : const SizedBox(),
      loading: () => const SizedBox(),
      error: (error, stackTrace) => const SizedBox(),
    );
  }
}