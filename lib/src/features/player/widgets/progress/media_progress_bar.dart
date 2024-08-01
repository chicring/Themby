

import 'dart:async';

import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:themby/src/common/constants.dart';
import 'package:themby/src/features/player/service/controls_service.dart';
import 'package:themby/src/features/player/service/video_controller.dart';
import 'package:themby/src/features/player/widgets/progress/draging_time.dart';
import 'package:themby/src/features/player/widgets/progress/progress_toast.dart';


class MediaProgressBar extends ConsumerStatefulWidget{

  const MediaProgressBar({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MediaProgressBar();

}

class _MediaProgressBar extends ConsumerState<MediaProgressBar>{
  //播放位置时间
  Duration position = const Duration(seconds: 0);

  //视频时长
  Duration duration = const Duration(seconds: 0);

  //缓冲时长
  Duration buffer = const Duration(seconds: 0);

  bool isPlaying = false;

  bool isBuffering = false;

  List<StreamSubscription> subscriptions = [];

  @override
  void initState() {
    super.initState();

    subscriptions.addAll(
        [
          ref.read(videoControllerProvider).player.stream.duration.listen((event) {
            duration = event;
            setState(() {
            });
          }),
          ref.read(videoControllerProvider).player.stream.position.listen((event) {
            if(event - position > const Duration(seconds: 1) || event - position < const Duration(seconds: -1)){
              position = event;

              if(duration != ref.read(videoControllerProvider).player.state.duration){
                duration = ref.read(videoControllerProvider).player.state.duration;
              }
              setState(() {
              });
            }
          }),
          ref.read(videoControllerProvider).player.stream.buffer.listen((event) {
            buffer = event;
          }),
          ref.read(videoControllerProvider).player.stream.playing.listen((event) {
            isPlaying = event;
            setState(() {
            });
          }),
          ref.read(videoControllerProvider).player.stream.buffering.listen((event) {
            isBuffering = event;
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


    return ProgressBar(
      progress: position,
      total: duration,
      buffered: buffer,
      bufferedBarColor: Colors.white.withOpacity(0.5),
      progressBarColor: Colors.white,
      thumbColor: Colors.white,
      baseBarColor: Colors.white.withOpacity(0.2),
      timeLabelLocation: TimeLabelLocation.sides,
      timeLabelTextStyle: StyleString.subtitleStyle.copyWith(color: Colors.white),
      barHeight: 6,
      thumbRadius: 10,
      onDragStart: (duration) {
        ///打开toast
        SmartDialog.show(
            tag: "progress_toast",
            alignment: Alignment.topCenter,
            maskColor: Colors.transparent,
            builder: (_) => const ProgressToast()
        );
      },
      onDragUpdate: (duration){
        ///更新toast 显示时间
        ref.read(dragingTimeProvider.notifier).update(duration.timeStamp);
      },
      onSeek: (duration) {
        ref.read(controlsServiceProvider.notifier).seekTo(duration);
      },
      onDragEnd: () {
        ///关闭toast
        SmartDialog.dismiss(tag: "progress_toast");
      },
    );
  }
}