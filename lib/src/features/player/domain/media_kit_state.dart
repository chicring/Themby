
import 'package:flutter/material.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';


List<Map<String, dynamic>> videoFitType = [
  {'attr': BoxFit.contain, 'desc': '包含'},
  {'attr': BoxFit.cover, 'desc': '覆盖'},
  {'attr': BoxFit.fill, 'desc': '填充'},
  {'attr': BoxFit.fitHeight, 'desc': '高度适应'},
  {'attr': BoxFit.fitWidth, 'desc': '宽度适应'},
  {'attr': BoxFit.scaleDown, 'desc': '缩小适应'},
];

class MediaKitState{

  late Player playboy;

  late final VideoController controller;

  String playingTitle = '';

  late final String singleUrl;

  int playingIndex = 0;

  //播放位置时间
  Duration position = const Duration();

  //视频时长
  Duration duration = const Duration();


  bool playing = false;

  bool seeking = false;
  
  double seekingPos = 0;

  //视频方向
  String direction = 'horizontal';

  //填充方式
  int fitType = 0;
  
  
  MediaKitState.internal(){
    playboy = Player(
      configuration: const PlayerConfiguration(
        bufferSize: 5 * 1024 * 1024
      )
    );
    controller = VideoController(playboy);

    playboy.stream.position.listen((event) {
      position = event;
    });
    playboy.stream.playing.listen((event) {
      playing = event;
    });
    playboy.stream.duration.listen((event) {
      duration = event;
    });
  }
}