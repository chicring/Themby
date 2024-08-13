

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:themby/src/common/constants.dart';
import 'package:themby/src/features/emby/domain/selected_media.dart';
import 'package:themby/src/features/player/service/lock_service.dart';
import 'package:themby/src/features/player/widgets/buttons/lock_button.dart';
import 'package:themby/src/features/player/widgets/buttons/play_next_button.dart';
import 'package:themby/src/features/player/widgets/buttons/play_or_pause_button.dart';
import 'package:themby/src/features/player/widgets/buttons/play_previous_button.dart';
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

    double height = MediaQuery.sizeOf(context).height;

    return SafeArea(
      minimum: const EdgeInsets.all(StyleString.safeSpace),
      child: Stack(
        fit: StackFit.passthrough,
        alignment: Alignment.center,
        clipBehavior: Clip.none,

        children: [
          const Positioned.fill(
             left: 12,
             right: 12,
             bottom: 100,
             top: 12,
             child: HorizontalScreenGestures(),
          ),
          Positioned(
            top: 6,
            left: 6,
            child: _showOrHide(const TitleLogo()),
          ),
          Positioned(
            top: 6,
            right: 6,
            child:_showOrHide(_buildTapSheet()),
          ),
          const Positioned(
            right: 6,
            child: LockButton(),
          ),
          Positioned(
            bottom: 0,
            left: 6,
            right: 6,
            child: _showOrHide(const Column(
                children: [
                  MediaProgressBar(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          PlayPreviousButton(),
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
              ))
          ),
        ],
      ),
    );
  }

  Widget _buildTapSheet(){
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const InternetSpeedChip(),
        const SizedBox(width: 6),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: const Color(0xAA333333),
            borderRadius: BorderRadius.circular(12),
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
        )
      ],
    );
  }

  Widget _showOrHide(Widget child){
    return Consumer(
      builder: (context, ref, _){
        return IgnorePointer(
          ignoring: ref.watch(lockServiceProvider).controlsLock,
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 300),
            opacity: ref.watch(lockServiceProvider).showControls ? 1 : 0,
            child: child,
          ),
        );
      },
    );
  }

}