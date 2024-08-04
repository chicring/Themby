import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:themby/src/features/emby/data/view_repository.dart';
import 'package:themby/src/features/emby/domain/emby/item.dart';
import 'package:themby/src/features/player/constants.dart';
import 'package:themby/src/features/player/service/controls_service.dart';

import 'Item_card.dart';


class ItemSheet extends ConsumerStatefulWidget{
  const ItemSheet({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ItemSheet();

}

class _ItemSheet extends ConsumerState<ItemSheet>{

  late String requestId;

  late AsyncValue<List<Item>> items;

  @override
  Widget build(BuildContext context) {

    final double width = MediaQuery.of(context).size.width;

    final double cardWidth = width / 7;

    final state = ref.watch(controlsServiceProvider);

    if(state.playType == 'Series' ) {
      requestId = state.mediaId!;
      items = ref.watch(getNextUpProvider(requestId));
    }else if(state.playType == 'Episode'){
      requestId = state.parentId!;
      items = ref.watch(getEpisodesProvider(requestId,requestId));
    }else {
      items = const AsyncValue.data([]);
    }

    return Container(
      width: width / 3,
      color: Colors.black.withOpacity(0.85),
      padding: const EdgeInsets.all(10),
      child: items.when(
        data: (data) => ListView.builder(
          itemCount: data.length,
          itemBuilder: (context,index){
            return ItemCard(
              item: data[index],
              width: cardWidth,
              height: cardWidth * 9 / 16,
              press: () {
                ref.read(controlsServiceProvider.notifier).togglePlayMedia(data[index].id!, data[index].indexNumber!);
                SmartDialog.dismiss(tag: TagsString.episodeSheetDialog);
              },
            );
          },
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error,_) => const Center(child: Text('Error')),
      ),
    );
  }
}

