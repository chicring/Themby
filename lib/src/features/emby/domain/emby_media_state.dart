

import 'package:themby/src/features/emby/domain/media.dart';
import 'package:themby/src/features/emby/domain/view.dart';

class EmbyMediaState{

  late final View? view;

  late final Map<String, List<Media>>? lastMedias;

  EmbyMediaState({
    this.view,
    this.lastMedias
  });

  EmbyMediaState copyWith({
    View? view,
    Map<String, List<Media>>? lastMedias
  }){
    return EmbyMediaState(
      view: view ?? this.view,
      lastMedias: lastMedias ?? this.lastMedias
    );
  }

}