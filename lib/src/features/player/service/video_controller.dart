

import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'video_controller.g.dart';

@riverpod
VideoController videoController(VideoControllerRef  ref){

  Player player = Player();
  return VideoController(
    player,
    configuration: const VideoControllerConfiguration(
      enableHardwareAcceleration: true,
      androidAttachSurfaceAfterVideoParameters: false,
    ),
  );
}