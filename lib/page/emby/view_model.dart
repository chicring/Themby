
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:themby/common/models/emby_site.dart';
import 'package:themby/page/emby/state.dart';
import '../../common/api/emby/index.dart';

part 'view_model.g.dart';

@riverpod
class EmbyVM extends _$EmbyVM{

  @override
  EmbyState build() {
    return EmbyState.inital();
  }

  Future<void> init(EmbySite site) async {
    state = state.copyWith(site: site);
    loadViews();
  }

  Future<void> loadViews() async {
    await ViewApi.getView(state.site!).then((value) {
      state = state.copyWith(views : value);
      ref.invalidateSelf();
    });
  }


}