
import 'dart:async';

import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:themby/src/common/constants.dart';
import 'package:themby/src/features/player/service/controls_service.dart';
import 'package:themby/src/features/player/service/video_controller.dart';
import 'package:themby/src/features/player/widget/slide_sheet.dart';

class BottomControl extends ConsumerStatefulWidget {
  const BottomControl({super.key});

  @override
  ConsumerState<BottomControl> createState() => _BottomControl();
}

class _BottomControl extends ConsumerState<BottomControl> {
  //播放位置时间
  Duration position = const Duration(seconds: 0);

  //视频时长
  Duration duration = const Duration(seconds: 0);

  List<StreamSubscription> subscriptions = [];

  @override
  void initState() {
    super.initState();

    subscriptions.addAll(
      [
        ref.read(videoControllerProvider).player.stream.duration.listen((event) {
          duration = event;
        }),
        ref.read(videoControllerProvider).player.stream.position.listen((event) {
          if(event - position > const Duration(seconds: 1) || event - position < const Duration(seconds: -1)){
            position = event;
            setState(() {
            });
          }
        }),
      ]
    );
  }

  @override
  void dispose(){
    for (var element in subscriptions) {
      element.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {


    return Container(
      width: MediaQuery.sizeOf(context).width,
      color: Colors.transparent,
      padding:  const EdgeInsets.all(StyleString.safeSpace),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 12,bottom: 0),
            child: ProgressBar(
              progress: position,
              total: duration,
              progressBarColor: Colors.white,
              thumbColor: Colors.white,
              baseBarColor: Colors.white.withOpacity(0.2),
              timeLabelLocation: TimeLabelLocation.none,
              barHeight: 8,
              thumbRadius: 10,
              onDragStart: (duration) {
                ref.read(controlsServiceProvider.notifier).cancelAutoHideControls();
              },
              onSeek: (duration) {
                ref.read(controlsServiceProvider.notifier).seekTo(duration);
              },
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                child: Text(
                  '${position.inMinutes}:${position.inSeconds.remainder(60)} / ${duration.inMinutes}:${duration.inSeconds.remainder(60)}',
                  style: StyleString.subtitleStyle.copyWith(color: Colors.white),
                ),
              ),
              IconButton(
                constraints: const BoxConstraints(
                  maxHeight: 30,
                ),
                icon: const Icon(Icons.speed_rounded, color: Colors.white),
                onPressed: () => (
                  showShadSheet(
                    side: ShadSheetSide.right,
                    context: context,
                    builder: (context) => const RateSheet()
                  ),
                  ref.read(controlsServiceProvider.notifier).setRate(2)
                ),
              )
            ],
          ),
          const SizedBox(height: 5),
        ],
      ),
    );
  }

}