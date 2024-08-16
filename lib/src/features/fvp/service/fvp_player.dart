import 'package:fvp/mdk.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'fvp_player.g.dart';

@riverpod
Player fvpPlayer(FvpPlayerRef ref){
  return Player();
}