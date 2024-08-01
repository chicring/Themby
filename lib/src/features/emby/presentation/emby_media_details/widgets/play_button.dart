

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:go_router/go_router.dart';
import 'package:themby/src/common/constants.dart';
import 'package:themby/src/features/emby/application/emby_media_service.dart';
import 'package:themby/src/features/emby/domain/emby/item.dart';

class PlayButton extends ConsumerWidget{

  const PlayButton({super.key, required this.item});

  final Item item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final double width = MediaQuery.sizeOf(context).width;

    return GestureDetector(
      onTap: () async {
        final selectedMedia = ref.read(embyMediaServiceProvider.notifier).getSelectedMedia(item);
        GoRouter.of(context).push('/player', extra: selectedMedia);
      },
      onLongPress: (){
        SmartDialog.showToast('别长按我，等待播放');
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if(item.userData?.playedPercentage != null)
            Padding(
              padding: const EdgeInsets.only(left: StyleString.safeSpace, right: StyleString.safeSpace, bottom: StyleString.safeSpace),
              child: SizedBox(
                width: width,
                child: LinearProgressIndicator(
                  value: (item.userData?.playedPercentage ?? 0) / 100,
                  backgroundColor: Colors.grey.withOpacity(0.5),
                  borderRadius: StyleString.lgRadius,
                ),
              ),
            ),

          Container(
            margin: const EdgeInsets.symmetric(horizontal: StyleString.safeSpace),
            decoration: BoxDecoration(
              borderRadius: StyleString.lgRadius,
              color: Theme.of(context).colorScheme.primary,
            ),
            width: width,
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.play_arrow_rounded , color: Theme.of(context).colorScheme.onPrimary),
                const SizedBox(width: 10),
                Text('播放', style: StyleString.titleStyle.copyWith(color: Theme.of(context).colorScheme.onPrimary)),
              ],
            ),
          )
        ],
      ),
    );
  }

}