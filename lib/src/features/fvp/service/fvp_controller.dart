
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:fvp/mdk.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:themby/src/features/fvp/domain/fvp_state.dart';

import 'fvp_player.dart';

part 'fvp_controller.g.dart';

@riverpod
class FvpController extends _$FvpController {

  @override
  FvpState build() => FvpState();

  void play(String path, {int position = 0}) async {
    updateTexture();
    ref.read(fvpPlayerProvider).setMedia(path, MediaType.video);
    seekTo(position);
    ref.read(fvpPlayerProvider).playbackRate = 1;
  }

  void playOrPause() {
    ref.read(fvpPlayerProvider).state = ref.read(fvpPlayerProvider).state == PlaybackState.playing
        ? PlaybackState.paused
        : PlaybackState.playing;

  }

  void stop() async {
    state = state.copyWith(textureId: null);
    ref.read(fvpPlayerProvider).state = PlaybackState.stopped;
  }

  void seekTo(int position) {
    ref.read(fvpPlayerProvider).seek(position: position, flags: const SeekFlag(SeekFlag.fast));
  }

  Future<int> updateTexture() async {
    if (state.textureId != null) {
      stop();
    }
    int ttId = await ref.read(fvpPlayerProvider).updateTexture();

    print('textureId: $ttId');

    state = state.copyWith(textureId: ttId);

    return ttId;
  }

}