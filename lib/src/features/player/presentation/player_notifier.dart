import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'player_notifier.g.dart';

@riverpod
class PlayerNotifier extends _$PlayerNotifier{

  @override
  String build() => '';

  Future<void> setUrl(String url) async {
    state = url;
    print('播放链接：'+state);
  }
}