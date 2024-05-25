import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:themby/common/helper/Prefs_helper.dart';
import 'package:themby/common/models/emby_site.dart';
import 'package:themby/page/home/state.dart';

import '../../common/models/emby_config.dart';
import '../../common/models/user.dart';


part 'view_model.g.dart';

@riverpod
class HomeVM extends _$HomeVM {
  @override
  HomeState build() => HomeState.initial();


  Future<void> addSite() async {

  }

  Future<void> removeSite(EmbySite site) async {

  }
}