
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:themby/src/common/data/player_setting.dart';

part 'themby_controller.g.dart';

class ThembyController{

  ThembyController({required this.mpvBufferSize, required this.mpvHardDecoding});

  int mpvBufferSize;

  bool mpvHardDecoding;

  late VideoController videoController;

  VideoController get controller => videoController;


  Future init() async {
    Player player =  Player(
        configuration: PlayerConfiguration(
            bufferSize: 1024 * 1024 * mpvBufferSize,
            libass: true,
            logLevel: MPVLogLevel.debug
        )
    );
    if (Platform.isAndroid) {
      NativePlayer nativePlayer = player.platform as NativePlayer;
      final ByteData data = await rootBundle.load("assets/fonts/subfont.ttf");
      final Uint8List buffer = data.buffer.asUint8List();
      final Directory directory = await getApplicationSupportDirectory();
      final String fontsDir = "${directory.path}/fonts";
      final File file = File("$fontsDir/subfont.ttf");
      await file.create(recursive: true);
      await file.writeAsBytes(buffer);
      nativePlayer.setProperty("sub-fonts-dir", fontsDir);
      nativePlayer.setProperty("sub-font", "Droid Sans Fallback");
    }

    videoController = VideoController(
      player,
      configuration: VideoControllerConfiguration(
        enableHardwareAcceleration: mpvHardDecoding,
        androidAttachSurfaceAfterVideoParameters: false,
      ),
    );
  }
}

@riverpod
ThembyController thembyController(ThembyControllerRef ref){
  return ThembyController(
    mpvBufferSize: ref.watch(playerSettingProvider).mpvBufferSize,
    mpvHardDecoding: ref.watch(playerSettingProvider).mpvHardDecoding
  );
}

@riverpod
VideoController videoController(VideoControllerRef ref){
  return ref.watch(thembyControllerProvider).controller;
}

