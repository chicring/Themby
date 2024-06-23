
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:themby/src/features/player/presentation/player_notifier.dart';

class BottomControl extends ConsumerStatefulWidget implements PreferredSizeWidget {
  const BottomControl({super.key});

  @override
  ConsumerState<BottomControl> createState() => _BottomControl();

  @override
  Size get preferredSize => const Size(double.infinity, kToolbarHeight);
}

class _BottomControl extends ConsumerState<BottomControl> {


  @override
  Widget build(BuildContext context) {

    final state = ref.watch(playerNotifierProvider);
    final notifier = ref.watch(playerNotifierProvider.notifier);

    Color colorTheme = Theme.of(context).colorScheme.primary;

    return Container(
      color: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 7,right: 7,bottom: 0),
            child: ProgressBar(
              progress: state.position,
              total: state.duration,
              progressBarColor: colorTheme,
              baseBarColor: Colors.white.withOpacity(0.2),
              bufferedBarColor: colorTheme.withOpacity(0.4),
              barHeight: 4,
              thumbRadius: 8,
            ),
          )
        ],
      ),
    );
  }

}