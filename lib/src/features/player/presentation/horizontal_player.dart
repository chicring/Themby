import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:media_kit_video/media_kit_video.dart';
import 'package:themby/src/features/player/domain/media_kit_state.dart';
import 'package:themby/src/features/player/service/controls_service.dart';
import 'package:themby/src/features/player/service/medias_service.dart';
import 'package:themby/src/features/player/utils/fullscreen.dart';
import 'package:themby/src/features/player/widget/app_bar_ani.dart';
import 'package:themby/src/features/player/widget/bottom_control.dart';

class HorizontalPlayer extends ConsumerStatefulWidget {
  const HorizontalPlayer({super.key, required this.id, required this.type});

  final String id;
  final String type;

  @override
  ConsumerState<HorizontalPlayer> createState() => _HorizontalPlayer();
}

class _HorizontalPlayer extends ConsumerState<HorizontalPlayer> with TickerProviderStateMixin{

  late AnimationController animationController;


  @override
  void initState(){
    super.initState();
    // // 横屏 和 全屏
    // enterFullScreen();
    // enterLandscapeMode();

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );
  }

  @override
  void deactivate(){
    super.deactivate();
    final controlsNotifier = ref.read(controlsServiceProvider.notifier);
    final mediasNotifier = ref.read(mediasServiceProvider.notifier);
    controlsNotifier.dispose();
    mediasNotifier.dispose();
  }

  @override
  void dispose() {
    animationController.dispose();
    // exitFullScreen();
    // exitLandscapeMode();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final state = ref.watch(controlsServiceProvider);
    final notifier = ref.watch(controlsServiceProvider.notifier);

    notifier.startPlay(widget.id);

    //开始播放
    // ;

    double totalWidth = MediaQuery.sizeOf(context).width;
    double totalHeight = MediaQuery.sizeOf(context).height;

    return Stack(
      fit: StackFit.passthrough,
      children: [
        Video(
            controller: state.controller,
            pauseUponEnteringBackgroundMode: true,
            resumeUponEnteringForegroundMode: false,
            alignment: Alignment.center,
            fit: videoFitType[state.fitType]['attr'],
            controls: (state){
              return Center(
                child: IconButton(
                  icon: const Icon(Icons.pause),
                  onPressed: (){
                   state.toggleFullscreen();
                  },
                ),
              );
            },
        ),
        Positioned.fill(
          left: 16,
          top: 25,
          bottom: 15,
          right: 15,
          child: GestureDetector(
            onDoubleTapDown: (TapDownDetails details){
              final double tapPosition = details.localPosition.dx;
              final double sectionWidth = totalWidth / 3;
              String type = 'left';
              if (tapPosition < sectionWidth) {
                type = 'left';
              } else if (tapPosition < sectionWidth * 2) {
                notifier.onDoubleTapCenter();
              } else {
                type = 'right';
              }
            },
          ),
        ),
        // SafeArea(
        //   top: false,
        //   bottom: false,
        //   child: Column(
        //     children: [
        //       const Spacer(),
        //       ClipRect(
        //         child: AppBarAni(
        //           controller: animationController,
        //           visible: state.bottomShow && !state.controlsLock,
        //           position: 'bottom',
        //           child: const BottomControl(),
        //         ),
        //       )
        //     ],
        //   ),
        // )
      ],
    );
  }
}