

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:go_router/go_router.dart';
import 'package:themby/src/common/constants.dart';
import 'package:themby/src/features/emby/application/emby_common_service.dart';
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
      child: Container(
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
            (item.userData?.playedPercentage != null && item.type != 'Series')  ?
            Text('继续播放 ${durationToTime(Duration(milliseconds: item.userData!.playbackPositionTicks!  ~/ 10000))}', style: StyleString.titleStyle.copyWith(color: Theme.of(context).colorScheme.onPrimary))
                : Text('播放', style: StyleString.titleStyle.copyWith(color: Theme.of(context).colorScheme.onPrimary)),
          ],
        ),
      ),
    );
  }

}