

import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'video_controller.g.dart';

@riverpod
VideoController videoController(VideoControllerRef  ref){

  Player player = Player(
      configuration: const PlayerConfiguration(
          bufferSize: 5 * 1024 * 1024
      )
  );
  return VideoController(
    player,
    configuration: const VideoControllerConfiguration(
      enableHardwareAcceleration: true,
      androidAttachSurfaceAfterVideoParameters: false,
    ),
  );
}