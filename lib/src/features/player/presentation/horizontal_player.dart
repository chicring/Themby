import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:media_kit_video/media_kit_video.dart';
import 'package:themby/src/features/player/domain/media_kit_state.dart';
import 'package:themby/src/features/player/presentation/player_notifier.dart';

class HorizontalPlayer extends ConsumerStatefulWidget {
  const HorizontalPlayer({super.key});

  @override
  ConsumerState<HorizontalPlayer> createState() => _HorizontalPlayer();
}

class _HorizontalPlayer extends ConsumerState<HorizontalPlayer> {

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {

    final state = ref.watch(playerNotifierProvider);
    final notifier = ref.watch(playerNotifierProvider.notifier);

    notifier.startPlay();

    double totalWidth = MediaQuery.sizeOf(context).width;
    double totalHeight = MediaQuery.sizeOf(context).height;

    return Center(
      child: SizedBox(
        width: totalWidth,
        height: totalWidth,
        child: Stack(
          fit: StackFit.passthrough,
          children: [
            Video(
              controller: state.controller,
              controls: NoVideoControls,
              pauseUponEnteringBackgroundMode: false,
              resumeUponEnteringForegroundMode: false,
              alignment: Alignment.center,
              fit: videoFitType[state.fitType]['attr']
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
            SafeArea(
              top: false,
              bottom: false,
              child: Column(

              ),
            )
          ],
        ),
      ),
    );
  }
}