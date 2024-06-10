import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:themby/src/features/emby/domain/emby_media_state.dart';
import 'package:themby/src/features/emby/data/view_repository.dart';
import 'package:themby/src/features/emby/domain/media.dart';
import 'package:themby/src/features/emby/domain/view.dart';


part 'emby_media_service.g.dart';

@riverpod
class EmbyMediaService extends _$EmbyMediaService{

  @override
  Future<EmbyMediaState> build() async{
    final view = ref.watch(getViewsProvider);
    View? viewData;
    Map<String, List<Media>>? lastMedias;

    view.whenData((value) =>{
      viewData = value,
      value.items.map((item) async {
        final media = await ref.read(viewRepositoryProvider).getLastMedia(item.parentId);
        lastMedias![item.name] = media;
      })
    });

    return EmbyMediaState(
      view: viewData,
      lastMedias: lastMedias
    );
  }

}