//
//
// import 'dart:io';
//
// import 'package:flutter/services.dart';
// import 'package:media_kit/media_kit.dart';
// import 'package:media_kit_video/media_kit_video.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:riverpod_annotation/riverpod_annotation.dart';
// import 'package:themby/src/common/data/player_setting.dart';
//
// part 'video_controller.g.dart';
//
//
// @riverpod
// VideoController videoController(VideoControllerRef ref){
//
//   Player player = Player(
//       configuration: PlayerConfiguration(
//         bufferSize: 1024 * 1024 * ref.watch(playerSettingProvider).mpvBufferSize,
//         libass: true,
//         logLevel: MPVLogLevel.debug
//       )
//   );
//
//   VideoController controller = VideoController(
//     player,
//     configuration: VideoControllerConfiguration(
//       enableHardwareAcceleration: ref.watch(playerSettingProvider).mpvHardDecoding,
//       androidAttachSurfaceAfterVideoParameters: false,
//     ),
//   );
//
//   ref.onDispose(() {
//     player.dispose();
//   });
//   return controller;
// }