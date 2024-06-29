import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:media_kit_video/media_kit_video.dart';
import 'package:themby/src/features/player/service/controls_service.dart';
import 'package:themby/src/features/player/service/video_controller.dart';
import 'package:themby/src/features/player/widget/bottom_control.dart';
import 'package:themby/src/features/player/widget/top_control.dart';

class CustomControls extends ConsumerStatefulWidget {
  const CustomControls({super.key,required this.state,required this.id});
  final String id;
  final VideoState state;
  @override
  ConsumerState<CustomControls> createState() => _CustomControls();
}

class _CustomControls extends ConsumerState<CustomControls> {

  @override
  void initState() {
    super.initState();
  }


  @override
  void dispose(){
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double totalWidth = MediaQuery.sizeOf(context).width;
    double totalHeight = MediaQuery.sizeOf(context).height;

    final state = ref.watch(controlsServiceProvider);
    final notifier = ref.read(controlsServiceProvider.notifier);

    return Stack(
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
                notifier.onDoubleTapLeft();
              } else if (tapPosition < sectionWidth * 2) {
                widget.state.widget.controller.player.playOrPause();
              } else {
                notifier.onDoubleTapRight();
              }
            },
            onLongPressStart: (LongPressStartDetails detail){
              ref.read(controlsServiceProvider.notifier).longPressSpeed();
            },
            onLongPressEnd: (LongPressEndDetails detail){
              widget.state.widget.controller.player.setRate(1);
              SmartDialog.dismiss();
            },
          ),
        ),
        Positioned(
            right: 12,
            child: AnimatedOpacity(
              curve: Curves.easeInOut,
              duration: const Duration(milliseconds: 200),
              opacity: state.showControls ? 1 : 0,
              child: IconButton(
                icon: Icon(
                  state.controlsLock ? Icons.lock_outline_rounded : Icons.lock_open_rounded,
                  color: Colors.white,
                  size: 30,
                ),
                onPressed: (){
                  notifier.lockOrUnlock();
                },
              ),
            )
        ),
        Positioned(
            top: 0,
            child: AnimatedOpacity(
              curve: Curves.easeInOut,
              duration: const Duration(milliseconds: 200),
              opacity: state.showControls & !state.controlsLock  ? 1 : 0,
              child: Visibility(
                visible: state.showControls & !state.controlsLock,
                maintainState: true,
                child: TopControl(id: widget.id),
              ),
            )
        ),
        Positioned(
            bottom: 0,
            child: AnimatedOpacity(
              curve: Curves.easeInOut,
              duration: const Duration(milliseconds: 200),
              opacity: state.showControls & !state.controlsLock  ? 1 : 0,
              child: Visibility(
                visible: state.showControls & !state.controlsLock,
                maintainState: true,
                child: const BottomControl(),
              ),
            )
        )
      ],
    );
  }
}


