

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:themby/src/features/player/service/video_controller.dart';

class PlayOrPauseButton extends ConsumerStatefulWidget{
  const PlayOrPauseButton({super.key});


  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PlayOrPauseButtonState();
}

class _PlayOrPauseButtonState extends ConsumerState<PlayOrPauseButton>{
  bool isPlaying = false;

  late StreamSubscription subscription;

  @override
  void initState() {
    super.initState();
    subscription = ref.read(videoControllerProvider).player.stream.playing.listen((event) {
      setState(() {
        isPlaying = event;
      });
    });
  }


  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isPlaying ? Icons.pause_rounded : Icons.play_arrow_rounded,
        color: Colors.white,
        size: 30,
      ),
      onPressed: (){
        ref.read(videoControllerProvider).player.playOrPause();
      },
    );
  }
}