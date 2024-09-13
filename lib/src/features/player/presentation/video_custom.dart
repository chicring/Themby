

import 'package:auto_orientation/auto_orientation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:media_kit_video/media_kit_video.dart';
import 'package:themby/src/common/constants.dart';
import 'package:themby/src/common/data/subtitle_setting.dart';
import 'package:themby/src/features/emby/data/view_repository.dart';
import 'package:themby/src/features/emby/domain/selected_media.dart';
import 'package:themby/src/features/player/presentation/play_control.dart';
import 'package:themby/src/features/player/service/controls_service.dart';
import 'package:themby/src/features/player/service/fit_type_service.dart';
import 'package:themby/src/features/player/service/themby_controller.dart';
import 'package:themby/src/features/player/service/volume_brightness_service.dart';
import 'package:themby/src/features/player/utils/fullscreen.dart';


class VideoCustom extends ConsumerStatefulWidget{
  const VideoCustom({super.key, required this.media});

  final SelectedMedia media;

  @override
  ConsumerState<VideoCustom> createState() => _VideoCustom();
}

class _VideoCustom extends ConsumerState<VideoCustom>{

  @override
  void initState(){
    super.initState();
    Future.microtask(() async {
      await ref.read(thembyControllerProvider).init();;
    });
    enterFullScreen();
    ref.read(controlsServiceProvider.notifier).startPlay(widget.media);
    ref.read(volumeBrightnessServiceProvider.notifier).update();
  }


  @override
  void deactivate(){
    /// 记录播放结束
    ref.read(controlsServiceProvider.notifier).recordPosition(type: "stop");
    ref.read(videoControllerProvider).player.stop();
    super.deactivate();
  }

  @override
  void dispose() {
    exitFull();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final fitType = ref.watch(fitTypeServiceProvider);
    final controller = ref.watch(videoControllerProvider);

    return Container(
        padding: const EdgeInsets.all(0),
        margin: const EdgeInsets.all(0),
        child: Stack(
          fit: StackFit.passthrough,
          children: [
            Video(
              key: ValueKey(fitType),
              controller: controller,
              pauseUponEnteringBackgroundMode: true,
              resumeUponEnteringForegroundMode: false,
              alignment: Alignment.center,
              fit: videoFitType[fitType]['attr'],
              subtitleViewConfiguration: SubtitleViewConfiguration(
                style: ref.watch(subtitleSettingProvider).subtitleStyle,
                padding: const EdgeInsets.all(24.0),
              ),
              controls: NoVideoControls,
            ),
            PlayControl(media: widget.media)
          ],
        )
    );
  }
}