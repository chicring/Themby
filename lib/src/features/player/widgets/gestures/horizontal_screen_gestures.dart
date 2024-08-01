

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:media_kit_video/media_kit_video_controls/src/controls/extensions/duration.dart';
import 'package:themby/src/features/player/service/controls_service.dart';
import 'package:themby/src/features/player/service/video_controller.dart';
import 'package:themby/src/features/player/widget/control_toast.dart';
import 'package:themby/src/features/player/widgets/progress/draging_time.dart';
import 'package:themby/src/features/player/widgets/progress/progress_toast.dart';

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
    final position = ref.read(videoControllerProvider).player.state.position;
    ref.read(videoControllerProvider).player.seek(position - const Duration(seconds: 10));
      SmartDialog.showToast(
        '',
        alignment: Alignment.topCenter,
        displayTime: const Duration(milliseconds: 800),
        displayType: SmartToastType.last,
        builder: (context) {
          return textToast('快退10秒');
        }
      );
  }

  Future<void> onDoublePressCenter() async{
    ref.read(videoControllerProvider).player.playOrPause();
  }

  Future<void> onDoublePressRight() async {
    final position = ref.read(videoControllerProvider).player.state.position;
    ref.read(videoControllerProvider).player.seek(position - const Duration(seconds: 10));

      SmartDialog.showToast(
        '',
        alignment: Alignment.topCenter,
        displayTime: const Duration(milliseconds: 800),
        displayType: SmartToastType.last,
        builder: (context) {
          return textToast('快退10秒');
        }
      );
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
      /// 横向滑动开始
      onHorizontalDragStart: (details) async{
        /// 打开进度条提示

        final position = controllerState.player.state.position;
        ref.read(dragingTimeProvider.notifier).update(position);
        print('duration1: ${position.inSeconds}');

        await SmartDialog.show(
            tag: "progress_toast",
            alignment: Alignment.topCenter,
            maskColor: Colors.transparent,
            builder: (_) => const ProgressToast()
        );
      },
      /// 横向滑动更新
      onHorizontalDragUpdate: (details) async{

        final current = ref.read(dragingTimeProvider);

        final double scale = 90000 / width;
        final pos = Duration(
            milliseconds: current.inMilliseconds + (details.delta.dx * scale).round()
        );

        final Duration result = pos.clamp(Duration.zero, controllerState.player.state.duration);

        ref.read(dragingTimeProvider.notifier).update(result);
      },
      /// 横向滑动结束
      onHorizontalDragEnd: (details) async{
        final pos = ref.read(dragingTimeProvider);
        controllerState.player.seek(pos);
        ///关闭toast 并 进行跳转
        await SmartDialog.dismiss(tag: "progress_toast");
      },
      onHorizontalDragCancel: () async{
        await SmartDialog.dismiss(tag: "progress_toast");
      },
    );
  }
}