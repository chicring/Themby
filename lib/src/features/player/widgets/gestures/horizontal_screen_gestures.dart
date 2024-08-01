

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:themby/src/features/player/service/controls_service.dart';
import 'package:themby/src/features/player/service/video_controller.dart';
import 'package:themby/src/features/player/widget/control_toast.dart';

class HorizontalScreenGestures extends ConsumerStatefulWidget{
  const HorizontalScreenGestures({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HorizontalScreenGestures();
}

class _HorizontalScreenGestures extends ConsumerState<HorizontalScreenGestures>{

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> onDoublePressLeft() async {

  }

  Future<void> onDoublePressCenter() async{
    ref.read(videoControllerProvider).player.playOrPause();
  }

  Future<void> onDoublePressRight() async {

  }

  @override
  Widget build(BuildContext context) {

    final notifier = ref.read(controlsServiceProvider.notifier);
    final controllerState = ref.read(videoControllerProvider);

    final double width = MediaQuery.sizeOf(context).width;

    return GestureDetector(
      onTap: (){
        notifier.showControls();
      },
      onDoubleTapDown: (details){
        final double tapPosition = details.localPosition.dx;
        final double sectionWidth = width / 3;
        if (tapPosition < sectionWidth) {
          onDoublePressLeft();
        } else if (tapPosition < sectionWidth * 2) {
          onDoublePressCenter();
        } else {
          onDoublePressRight();
        }
      },
      onLongPressStart: (details){
        final rate = controllerState.player.state.rate * 2;
        SmartDialog.show(
              tag: "show_long_press",
              alignment: Alignment.topCenter,
              maskColor: Colors.transparent,
              builder: (context) {
                return iconToast('$rate倍速快进中', Icons.fast_forward_rounded);
              }
          );
        controllerState.player.setRate( rate);
      },
      onLongPressEnd: (details){
        final rate = controllerState.player.state.rate;
        controllerState.player.setRate(rate / 2);
        SmartDialog.dismiss(tag: "show_long_press");
      },
    );
  }
}