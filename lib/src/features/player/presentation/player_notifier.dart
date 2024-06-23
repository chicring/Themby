import 'package:media_kit/media_kit.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:themby/src/features/player/domain/media_kit_state.dart';

part 'player_notifier.g.dart';

@riverpod
class PlayerNotifier extends _$PlayerNotifier{

  @override
  MediaKitState build() => MediaKitState.internal();

  Future<void> setUrl(String url) async {
    state.singleUrl = url;
    print('播放链接：'+state.singleUrl);
  }

  Future<void> startPlay() async {
    state.playboy.open(
        Media(state.singleUrl)
    );
    state.playboy.play();
  }

  //双击播放、暂停
  Future<void> onDoubleTapCenter() async{
    state.controller.player.playOrPause();
  }


}