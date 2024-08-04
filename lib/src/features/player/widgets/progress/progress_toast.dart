

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:themby/src/features/emby/application/emby_common_service.dart';
import 'package:themby/src/features/player/service/video_controller.dart';

import 'package:themby/src/features/player/widgets/progress/draging_time.dart';

class ProgressToast extends ConsumerWidget {
  const ProgressToast({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    Duration position = ref.watch(dragingTimeProvider);

    Duration duration = ref.read(videoControllerProvider).player.state.duration;

    return Container(
      margin: const EdgeInsets.only(top: 12),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0x88000000),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(durationToTime(position),style: const TextStyle(color: Colors.white)),
          const Text(' / ',style: TextStyle(color: Colors.white)),
          Text(durationToTime(duration),style: const TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}