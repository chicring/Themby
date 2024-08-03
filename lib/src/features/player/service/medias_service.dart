


import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:themby/src/features/emby/domain/emby/item.dart';
import 'package:themby/src/features/player/service/controls_service.dart';


part 'medias_service.g.dart';

@riverpod
class MediasService extends _$MediasService{

  static List<Item> items = [];

  @override
  List<Item> build(){
    return items;
  }


  void setItem(List<Item> its) {
    final controlsState = ref.watch(controlsServiceProvider);
    //
    // late
    //
    // if(controlsState.playType == 'Series' ) {
    //   requestId = controlsState.mediaId!;
    //   items = ref.watch(getNextUpProvider(requestId));
    // }else if(controlsState.playType == 'Episode'){
    //   requestId = controlsState.parentId!;
    //   items = ref.watch(getEpisodesProvider(requestId,requestId));
    // }else {
    //   items = const AsyncValue.data([]);
    // }
  }


  Future<void> removeAll() async{
    items = [];
    state = items;
  }

}