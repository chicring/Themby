
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';

class ControlsState {
  late Player playboy;

  late final VideoController controller;

  //播放位置时间
  Duration position = const Duration();

  //视频时长
  Duration duration = const Duration();

  //视频方向
  String direction = 'horizontal';

  //填充方式
  int fitType = 0;

  ControlsState.internal(){
    playboy = Player(
        configuration: const PlayerConfiguration(
            bufferSize: 8 * 1024 * 1024
        )
    );
    controller = VideoController(playboy);
  }

}