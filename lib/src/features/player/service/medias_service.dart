


import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:themby/src/features/emby/domain/episode.dart';
import 'package:themby/src/features/player/domain/medias_state.dart';
import 'package:themby/src/features/player/widget/sheet_control.dart';

part 'medias_service.g.dart';

@riverpod
class MediasService extends _$MediasService{

  static List<Episode> episodes = [];

  @override
  List<Episode> build(){
    return episodes;
  }


  void setEpisode(List<Episode> eps) {
    episodes = eps;
    state = episodes;
    // state = state.copyWith(episodes: episodes, playingIndex: index);
  }

  // Future<void> showEpisodeSheet() async{
  //   SmartDialog.show(
  //       alignment: Alignment.centerRight,
  //       maskColor: Colors.transparent,
  //       builder: (_){
  //         return episodeSheet(state);
  //       }
  //   );
  // }

  Future<void> removeEpisode() async{
    episodes = [];
    state = episodes;
  }

}