

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:themby/src/common/constants.dart';
import 'package:themby/src/features/emby/domain/selected_media.dart';
import 'package:themby/src/features/player/service/controls_service.dart';
import 'package:themby/src/features/player/utils/fullscreen.dart';
import 'package:themby/src/features/player/widgets/buttons/play_next_button.dart';
import 'package:themby/src/features/player/widgets/buttons/play_or_pause_button.dart';
import 'package:themby/src/features/player/widgets/buttons/toggle_rate_button.dart';
import 'package:themby/src/features/player/widgets/gestures/horizontal_screen_gestures.dart';
import 'package:themby/src/features/player/widgets/progress/media_progress_bar.dart';
import 'package:themby/src/features/player/widgets/title_logo.dart';

class PlayControl extends ConsumerStatefulWidget{

  const PlayControl({super.key, required this.media});

  final SelectedMedia media;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PlayControl();
}


class _PlayControl extends ConsumerState<PlayControl>{

  @override
  void initState() {
    super.initState();

    ref.read(controlsServiceProvider.notifier).startPlay(widget.media);
    enterFullScreen();
    landScape();
  }

  @override
  void dispose() {
    exitFullScreen();
    verticalScreen();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      minimum: EdgeInsets.all(StyleString.safeSpace),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          Positioned.fill(child: HorizontalScreenGestures()),
          Positioned(
            top: 6,
            left: 6,
            child: TitleLogo(),
          ),
          Positioned(
            bottom: 0,
            left: 12,
            right: 12,
            child: Column(
              children: [
                MediaProgressBar(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        PlayOrPauseButton(),
                        PlayNextButton(),
                      ],
                    ),


                    ToggleRateButton(),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}