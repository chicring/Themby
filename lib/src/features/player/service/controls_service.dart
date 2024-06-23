

import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:media_kit/media_kit.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:themby/src/features/player/domain/controls_state.dart';
import 'package:themby/src/features/player/service/medias_service.dart';

part 'controls_service.g.dart';

@riverpod
class ControlsService extends _$ControlsService{

  @override
  ControlsState build() => ControlsState.internal();

  Future<void> startPlay() async {
    String playUrl = ref.read(mediasServiceProvider).currentPlayUrl;

    if( playUrl.isEmpty){
      SmartDialog.showToast('播放还没有准备好');
      return;
    }
    state.playboy.open(Media(playUrl));
    state.playboy.play();
  }

  //双击暂停或者开始
  Future<void> onDoubleTapCenter() async{
    state.controller.player.playOrPause();
  }

}