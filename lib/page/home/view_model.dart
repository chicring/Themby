import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:themby/common/global.dart';
import 'package:themby/common/helper/prefs_helper.dart';
import 'package:themby/common/models/emby_site.dart';
import 'package:themby/page/home/state.dart';

import '../../common/models/emby_config.dart';
import '../../common/models/user.dart';
import '../../common/api/emby/index.dart';

part 'view_model.g.dart';

@riverpod
class HomeVM extends _$HomeVM {
  @override
  HomeState build() => HomeState.initial();


  Future<void> addSite() async {
    final EmbyConfig server = EmbyConfig(
      host: state.hostController.text,
      port: int.parse(state.portController.text),
    );

    LoginApi.login(
        state.usernameController.text,
        state.passwordController.text,
        server
    ).then((response) {
      print(response.data);
    });

  }

  Future<void> removeSite(EmbySite site) async {
  }
}