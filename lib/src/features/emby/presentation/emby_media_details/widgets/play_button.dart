

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
          borderRadius: BorderRadius.circular(26),
          color: Theme.of(context).colorScheme.primary,
        ),
        constraints: const BoxConstraints(
          minWidth: 300,
          maxWidth: 400,
        ),
        // width: width,
        height: 50,
        child: (item.userData?.playedPercentage != null && item.type != 'Series')
            ? _playResume(item.userData!.playedPercentage! / 100, remainingTime(item.runTimeTicks! - item.userData!.playbackPositionTicks!), context, width)
            : _play(context)
         ,
      ),
    );

  }

  // Widget e(){
  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.center,
  //     children: [
  //       Icon(Icons.play_arrow_rounded , color: Theme.of(context).colorScheme.onPrimary),
  //       const SizedBox(width: 10),
  //       (item.userData?.playedPercentage != null && item.type != 'Series')  ?
  //       Text('继续播放 ${durationToTime(Duration(milliseconds: item.userData!.playbackPositionTicks!  ~/ 10000))}', style: StyleString.titleStyle.copyWith(color: Theme.of(context).colorScheme.onPrimary))
  //           : Text('播放', style: StyleString.titleStyle.copyWith(color: Theme.of(context).colorScheme.onPrimary)),
  //     ],
  //   );
  // }
  String remainingTime(int ticks){
    final int duration = ticks ~/ 10000000;
    final int hours = duration ~/ 3600;
    final int minutes = (duration % 3600) ~/ 60;

    return '${hours > 0 ? '$hours' '小时 ' : ''}$minutes'' 分钟';
  }

  Widget _play(BuildContext context){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.play_arrow_rounded , size: 28, color: Theme.of(context).colorScheme.onPrimary),
        const SizedBox(width: 5),
        Text("播放",style: StyleString.titleStyle.copyWith(color: Theme.of(context).colorScheme.onPrimary)),
      ],
    );

  }

  Widget _playResume(double percentage,String text, BuildContext context,double width){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.play_arrow_rounded , size: 28, color: Theme.of(context).colorScheme.onPrimary),
        const SizedBox(width: 10),
        // SizedBox(
        //   width: width * 0.3,
        //   child: LinearProgressIndicator(
        //     value: percentage,
        //     borderRadius: StyleString.lgRadius,
        //     minHeight: 5,
        //     backgroundColor: Theme.of(context).colorScheme.onPrimary,
        //     valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).colorScheme.primaryFixedDim),
        //   ),
        // ),
        // const SizedBox(width: 10),

        // const SizedBox(width: 10),
        Text("剩 $text",style: StyleString.titleStyle.copyWith(color: Theme.of(context).colorScheme.onPrimary,height: 1,),),
      ],
    );
  }
}