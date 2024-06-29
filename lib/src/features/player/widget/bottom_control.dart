
import 'dart:async';

import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:themby/src/common/constants.dart';
import 'package:themby/src/features/player/service/controls_service.dart';
import 'package:themby/src/features/player/service/video_controller.dart';


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

  Duration buffer = const Duration(seconds: 0);

  bool isPlaying = false;


  List<StreamSubscription> subscriptions = [];

  @override
  void initState() {
    super.initState();

    subscriptions.addAll(
      [
        ref.read(videoControllerProvider).player.stream.duration.listen((event) {
          duration = event;
        }),
        ref.read(videoControllerProvider).player.stream.buffer.listen((event) {
          buffer = event;
        }),
        ref.read(videoControllerProvider).player.stream.playing.listen((event) {
          isPlaying = event;
          print('isPlaying: $isPlaying');
          setState(() {
          });
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

    final state = ref.watch(controlsServiceProvider);

    return Container(
      width: MediaQuery.sizeOf(context).width,
      color: Colors.transparent,
      padding:  const EdgeInsets.all(StyleString.safeSpace),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            children: [
              const SizedBox(width: StyleString.safeSpace),
              SizedBox(
                child: Text(
                  '${position.inMinutes}:${position.inSeconds.remainder(60)} / ${duration.inMinutes}:${duration.inSeconds.remainder(60)}',
                  style: StyleString.subtitleStyle.copyWith(color: Colors.white),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ProgressBar(
              progress: position,
              total: duration,
              buffered: buffer,
              bufferedBarColor: Colors.white.withOpacity(0.5),
              progressBarColor: Colors.white,
              thumbColor: Colors.white,
              baseBarColor: Colors.white.withOpacity(0.2),
              timeLabelLocation: TimeLabelLocation.none,
              barHeight: 6,
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
              Row(
                children: [
                  IconButton(
                    icon: Icon(
                      isPlaying ? Icons.pause_rounded : Icons.play_arrow_rounded,
                      color: Colors.white,
                      size: 30,
                    ),
                    onPressed: (){
                      ref.read(videoControllerProvider).player.playOrPause();
                    },
                  ),
                  IconButton(
                    onPressed: (){
                    },
                    icon: const Icon(
                      Icons.skip_next_rounded,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  TextButton(
                      onPressed: (){
                        SmartDialog.showToast('选集');
                      },
                      child: Text(
                        '选集',
                        style: StyleString.titleStyle.copyWith(color: Colors.white),
                      )
                  ),
                  TextButton(
                      onPressed: (){
                        ref.read(controlsServiceProvider.notifier).showSetSpeedSheet();
                      },
                      child: Text(
                        '${state.rate.toString()}x',
                        style: StyleString.titleStyle.copyWith(color: Colors.white),
                      )
                  ),
                  const SizedBox(width: 10),
                ],
              )
            ],
          ),
          const SizedBox(height: 5),
        ],
      ),
    );
  }

}