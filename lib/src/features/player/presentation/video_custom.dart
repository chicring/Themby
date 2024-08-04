

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:media_kit_video/media_kit_video.dart';
import 'package:themby/src/common/constants.dart';
import 'package:themby/src/features/emby/data/view_repository.dart';
import 'package:themby/src/features/emby/domain/selected_media.dart';
import 'package:themby/src/features/player/presentation/play_control.dart';
import 'package:themby/src/features/player/service/controls_service.dart';
import 'package:themby/src/features/player/service/fit_type_service.dart';
import 'package:themby/src/features/player/service/video_controller.dart';
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
    enterFullScreen();
    landScape();
    Future.microtask(() => ref.read(controlsServiceProvider.notifier).startPlay(widget.media));
  }


  @override
  void deactivate(){
    /// 记录播放结束············································································································
    ref.read(controlsServiceProvider.notifier).recordPosition(type: "stop");
    ref.read(videoControllerProvider).player.stop();
    super.deactivate();
  }

  @override
  void dispose() {
    exitFullScreen();
    verticalScreen();
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
          children: [
            Video(
              key: ValueKey(fitType),
              controller: controller,
              pauseUponEnteringBackgroundMode: true,
              resumeUponEnteringForegroundMode: false,
              alignment: Alignment.center,
              fit: videoFitType[fitType]['attr'],
              subtitleViewConfiguration: const SubtitleViewConfiguration(
                style: StyleString.subTitleStyle,
                padding: EdgeInsets.all(24.0),
              ),
              controls: NoVideoControls,
            ),
            PlayControl(media: widget.media)
          ],
        )
    );
  }
}