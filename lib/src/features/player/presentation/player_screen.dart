import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:media_kit_video/media_kit_video.dart';
import 'package:objectbox/objectbox.dart';
import 'package:themby/src/common/constants.dart';
import 'package:themby/src/common/domiani/play_info.dart';
import 'package:themby/src/features/emby/domain/selected_media.dart';
import 'package:themby/src/features/player/service/fit_type_service.dart';
import 'package:themby/src/features/player/service/video_controller.dart';
import 'package:themby/src/features/player/utils/fullscreen.dart';

import 'horizontal_player.dart';
import 'play_control.dart';

class PlayerScreen extends ConsumerWidget {

  const PlayerScreen({super.key, required this.media});

  final SelectedMedia media;

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final fitType = ref.watch(fitTypeServiceProvider);

    return Container(
      padding: const EdgeInsets.all(0),
      margin: const EdgeInsets.all(0),
      child: Video(
        key: ValueKey(fitType),
        controller: ref.watch(videoControllerProvider),
        pauseUponEnteringBackgroundMode: true,
        resumeUponEnteringForegroundMode: false,
        alignment: Alignment.center,
        fit: videoFitType[fitType]['attr'],
        subtitleViewConfiguration: const SubtitleViewConfiguration(
          style: StyleString.subTitleStyle,
          padding: EdgeInsets.all(24.0),
        ),
        controls: (state) => PlayControl(media: media),
      )
    );
  }
}