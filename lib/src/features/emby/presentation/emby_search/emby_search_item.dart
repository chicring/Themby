

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:themby/src/common/widget/dynamic_height_grid_view.dart';
import 'package:themby/src/common/widget/empty_data.dart';
import 'package:themby/src/extensions/constrains.dart';
import 'package:themby/src/features/emby/data/search_repository.dart';
import 'package:themby/src/features/emby/presentation/widgets/media_card_v.dart';
import 'package:themby/src/helper/screen_helper.dart';

import 'emby_search_query_notifier.dart';

class EmbySearchItem extends ConsumerWidget {
  const EmbySearchItem({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String query = ref.watch(embySearchQueryNotifierProvider);

    final respAsync = ref.watch(embySearchProvider(query));

    final mediaQuery = MediaQuery.of(context);

    return respAsync.when(
      loading: () => Center(child: Image.asset("assets/loading/loading-2.gif",height: 80)),
      error: (error, stack) =>  SizedBox(child: Text(error.toString()),),
      data: (data) {

        if(data.items.isEmpty){
          return const Center(child: EmptyData());
        }

        return DynamicHeightGridView(
          crossAxisCount: mediaQuery.smAndDown ? 3 : 8,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          builder: (BuildContext context, int index) {
            return LayoutBuilder(builder: (context, boxConstraints){
              return MediaCardV(
                item: data.items[index],
                width: boxConstraints.maxWidth,
                height: boxConstraints.maxWidth / 0.68,
              );
            });
          },
          itemCount: data.items.length,
        );

        // return Center(
        //   child: Wrap(
        //       alignment: WrapAlignment.start,
        //       spacing: 16,
        //       runSpacing: 5,
        //       children: [
        //         ...data.items.map((item){
        //           return SizedBox(
        //             height: cardHeight + 50,
        //             child: SizedBox(
        //               width: cardWidth,
        //               height: cardHeight,
        //               child: MediaCardV(
        //                 item: item,
        //               ),
        //             ),
        //           );
        //         })
        //       ]
        //   ),
        // );
      },
    );
  }
}