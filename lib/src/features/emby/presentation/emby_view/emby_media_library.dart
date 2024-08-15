
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:themby/src/features/emby/data/view_repository.dart';
import 'package:themby/src/features/emby/domain/emby/item.dart';
import 'package:themby/src/features/emby/presentation/widgets/list_card_h.dart';
import 'package:themby/src/features/emby/presentation/widgets/skeleton/list_card_h_skeleton.dart';


class EmbyMediaLibrary extends ConsumerWidget {
  const EmbyMediaLibrary({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final view = ref.watch(getViewsProvider);

    return Container(
      child: view.when(
        loading: () => const SizedBox(),
        error: (error, stack) => const SizedBox(),
        data: (data) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ...data.items.map((item) => MediaItemWidget(item: item)),
            ],
          );
        },
      ),
    );
  }
}

class MediaItemWidget extends ConsumerWidget {
  final Item item;

  const MediaItemWidget({required this.item, super.key});


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final media = ref.watch(getLastMediaProvider(item.id!));

    print("刷新列表${item.name}");

    return media.when(
      loading: () => const ListCardsHSkeleton(),
      error: (error, stack) => const SizedBox(),
      data: (value) => value.isEmpty
          ? const SizedBox()
          : ListCardsH(
        name: item.name!,
        parentId: item.id!,
        items: value,
      ),
    );
  }
}
