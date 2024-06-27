import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:media_kit_video/media_kit_video.dart';
import 'package:themby/src/features/player/domain/media_kit_state.dart';
import 'package:themby/src/features/player/service/controls_service.dart';
import 'package:themby/src/features/player/service/video_controller.dart';
import 'package:themby/src/features/player/utils/fullscreen.dart';
import 'package:themby/src/features/player/widget/bottom_control.dart';
import 'package:themby/src/features/player/widget/custom_controls.dart';

class HorizontalPlayer extends ConsumerStatefulWidget {
  const HorizontalPlayer({super.key, required this.id, required this.type});

  final String id;
  final String type;

  @override
  ConsumerState<HorizontalPlayer> createState() => _HorizontalPlayer();
}

class _HorizontalPlayer extends ConsumerState<HorizontalPlayer> with TickerProviderStateMixin{

  @override
  void initState(){
    super.initState();
    enterFullScreen();
    landScape();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final notifier = ref.watch(controlsServiceProvider.notifier);
    notifier.startPlay(widget.id);
  }

  @override
  void deactivate(){
    super.deactivate();
    final controlsNotifier = ref.read(controlsServiceProvider.notifier);
    controlsNotifier.dispose();
  }

  @override
  void dispose() {
    exitFullScreen();
    verticalScreen();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    // final state = ref.watch(controlsServiceProvider);
    //
    // double totalWidth = MediaQuery.sizeOf(context).width;
    // double totalHeight = MediaQuery.sizeOf(context).height;

    return SizedBox(
      child: Video(
        controller: ref.watch(videoControllerProvider),
        pauseUponEnteringBackgroundMode: true,
        resumeUponEnteringForegroundMode: false,
        alignment: Alignment.center,
        controls: (state) => CustomControls(state: state),
      ),
    );
  }
}