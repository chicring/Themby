import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:media_kit_video/media_kit_video.dart';
import 'package:themby/src/features/player/service/controls_service.dart';
import 'package:themby/src/features/player/service/video_controller.dart';
import 'package:themby/src/features/player/widget/bottom_control.dart';

class CustomControls extends ConsumerStatefulWidget {
  const CustomControls({super.key,required this.state});
  final VideoState state;
  @override
  ConsumerState<CustomControls> createState() => _CustomControls();
}

class _CustomControls extends ConsumerState<CustomControls> {

  bool isPlaying = false;

  List<StreamSubscription> subscriptions = [];

  @override
  void initState() {
    super.initState();

    subscriptions.addAll(
      [
        ref.read(videoControllerProvider).player.stream.playing.listen((event) {
          isPlaying = event;
          setState(() {
          });
        }),
      ]
    );
  }


  @override
  void dispose(){
    for (var element in subscriptions) {
      element.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double totalWidth = MediaQuery.sizeOf(context).width;
    double totalHeight = MediaQuery.sizeOf(context).height;

    final state = ref.watch(controlsServiceProvider);
    final notifier = ref.watch(controlsServiceProvider.notifier);

    return AnimatedOpacity(
      curve: Curves.easeInOut,
      duration: const Duration(milliseconds: 200),
      opacity: state.showControls? 1 : 0,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          Positioned.fill(
            left: 16,
            top: 25,
            bottom: 15,
            right: 15,
            child: GestureDetector(
              onTap: (){
                notifier.showOrHide();
              },
              onDoubleTapDown: (TapDownDetails details){
                final double tapPosition = details.localPosition.dx;
                final double sectionWidth = totalWidth / 3;
                if (tapPosition < sectionWidth) {
                } else if (tapPosition < sectionWidth * 2) {
                  widget.state.widget.controller.player.playOrPause();
                } else {
                }
              },
              onLongPressStart: (LongPressStartDetails detail){
                ref.read(controlsServiceProvider.notifier).longPressSpeed();
              },
              onLongPressEnd: (LongPressEndDetails detail){
                widget.state.widget.controller.player.setRate(1);
                ref.read(controlsServiceProvider.notifier).autoHideControls();
              },
            ),
          ),
          Center(
            child: IconButton(
              icon: Icon(
                isPlaying ? Icons.pause_circle_outline_rounded : Icons.play_arrow,
                color: Colors.white,
                size: 50,
              ),
              onPressed: (){
                widget.state.widget.controller.player.playOrPause();
              },
            )
          ),
          const Positioned(
            bottom: 0,
            child: BottomControl()
          )
        ],
      ),
    );
  }
}


