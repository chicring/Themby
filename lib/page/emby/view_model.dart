
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
    await loadViews();
  }

  Future<void> loadViews() async {
    ViewApi.getView(state.site!).then((value) {
      print(value.first.name);
      state = state.copyWith(views : value);
      ref.invalidateSelf();
    });
  }


}