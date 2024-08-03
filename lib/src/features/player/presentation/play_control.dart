

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:themby/src/common/constants.dart';
import 'package:themby/src/features/emby/domain/selected_media.dart';
import 'package:themby/src/features/player/service/controls_service.dart';
import 'package:themby/src/features/player/service/video_controller.dart';
import 'package:themby/src/features/player/utils/fullscreen.dart';
import 'package:themby/src/features/player/widgets/buttons/play_next_button.dart';
import 'package:themby/src/features/player/widgets/buttons/play_or_pause_button.dart';
import 'package:themby/src/features/player/widgets/buttons/toggle_audio_buttoon.dart';
import 'package:themby/src/features/player/widgets/buttons/toggle_fit_button.dart';
import 'package:themby/src/features/player/widgets/buttons/toggle_rate_button.dart';
import 'package:themby/src/features/player/widgets/buttons/toggle_subtitle_buttton.dart';
import 'package:themby/src/features/player/widgets/gestures/horizontal_screen_gestures.dart';
import 'package:themby/src/features/player/widgets/internet_speed_chip.dart';
import 'package:themby/src/features/player/widgets/progress/media_progress_bar.dart';
import 'package:themby/src/features/player/widgets/selections/selection_button.dart';
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
  }

  @override
  void deactivate(){
    super.deactivate();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: const EdgeInsets.all(StyleString.safeSpace),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          const Positioned.fill(
             left: 12,
             right: 12,
             bottom: 12,
             top: 12,
              child: HorizontalScreenGestures()
          ),
          const Positioned(
            top: 6,
            left: 6,
            child: TitleLogo(),
          ),
          Positioned(
            top: 6,
            right: 6,
            child: _buildTapSheet(),
          ),
          const Positioned(
            bottom: 0,
            left: 6,
            right: 6,
            child: Column(
              children: [
                MediaProgressBar(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        PlayOrPauseButton(),
                        PlayNextButton(),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SelectionButton(),
                        SizedBox(width: 6),
                        ToggleRateButton(),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTapSheet(){
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: const Color(0xAA333333),
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [

          ToggleFitButton(),

          SizedBox(width: 5),
          ToggleAudioButtoon(),

          SizedBox(width: 5),
          ToggleSubtitleButton()
        ],
      ),
    );
  }
}