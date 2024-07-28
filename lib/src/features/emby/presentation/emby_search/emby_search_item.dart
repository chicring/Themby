

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:themby/src/common/constants.dart';
import 'package:themby/src/features/emby/data/search_repository.dart';
import 'package:themby/src/features/emby/presentation/widget/media_card_v.dart';
import 'package:themby/src/helper/screen_helper.dart';

import 'emby_search_query_notifier.dart';

class EmbySearchItem extends ConsumerWidget {
  const EmbySearchItem({Key? key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String query = ref.watch(embySearchQueryNotifierProvider);

    final RespAsync = ref.watch(embySearchProvider(query));

    double cardWidth = ScreenHelper.getPortionAuto() + 10;
    double cardHeight = cardWidth / 0.65;

    return RespAsync.when(
      loading: () => Center(child: Image.asset("assets/loading/loading.gif",width: 248,)),
      error: (error, stack) => const SizedBox(),
      data: (data) {
        return Center(
          child: Wrap(
              alignment: WrapAlignment.start,
              spacing: 16,
              runSpacing: 5,
              children: [
                ...data.items.map((item){
                  return SizedBox(
                    height: cardHeight + 50,
                    child: SizedBox(
                      width: cardWidth,
                      height: cardHeight,
                      child: MediaCardV(
                        media: item,
                      ),
                    ),
                  );
                })
              ]
          ),
        );
      },
    );
  }
}