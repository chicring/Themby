
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:themby/src/features/player/presentation/player_notifier.dart';
import 'package:themby/src/features/player/service/controls_service.dart';

class BottomControl extends ConsumerStatefulWidget implements PreferredSizeWidget {
  const BottomControl({super.key});

  @override
  ConsumerState<BottomControl> createState() => _BottomControl();

  @override
  Size get preferredSize => const Size(double.infinity, kToolbarHeight);
}

class _BottomControl extends ConsumerState<BottomControl> {
  //播放位置时间
  Duration position = const Duration(seconds: 0);

  //视频时长
  Duration duration = const Duration(seconds: 0);


  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {

    Color colorTheme = Theme.of(context).colorScheme.primary;

    // final notifier = ref.watch(controlsServiceProvider.notifier);
    final state = ref.watch(controlsServiceProvider);

    state.playboy.stream.duration.listen((event) {
      duration = event;
    });

    state.playboy.stream.position.listen((event) {
      position = event;
      setState(() {
      });
    });

    state.playboy.stream.error.listen((error) => debugPrint(error));


    return Container(
      color: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 7,right: 7,bottom: 0),
            child: ProgressBar(
              progress: position,
              total: duration,
              progressBarColor: colorTheme,
              baseBarColor: Colors.white.withOpacity(0.2),
              bufferedBarColor: colorTheme.withOpacity(0.4),
              barHeight: 4,
              thumbRadius: 8,
              onSeek: (duration) {
                state.playboy.seek(Duration(seconds: duration.inSeconds));
              },
            ),
          )
        ],
      ),
    );
  }

}