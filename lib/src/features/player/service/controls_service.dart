

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

  void startListeners(){

    state.playboy.stream.duration.listen((event) {
      state.duration = event;
    });

    state.playboy.stream.position.listen((event) {
      state = state.copyWith(position: event);
      print(state.position);
    });

    state.playboy.stream.error.listen((event) {
      print('播放错误：'+event.toString());
    });

  }

  Future<void> startPlay() async {
    String playUrl = ref.watch(mediasServiceProvider).currentPlayUrl;

    if( playUrl.isEmpty){
      SmartDialog.showToast('播放还没有准备好');
      return;
    }
    print('播放链接：'+playUrl);
    await state.playboy.open(Media(playUrl));
    await state.playboy.play();
    startListeners();
  }

  //双击暂停或者开始
  Future<void> onDoubleTapCenter() async{
    state.controller.player.playOrPause();
  }

  Future<void> dispose() async {
    state.playboy.stop();
    state.playboy.dispose();
  }

}