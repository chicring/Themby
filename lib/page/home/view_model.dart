import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:themby/common/global.dart';
import 'package:themby/common/models/emby_site.dart';
import 'package:themby/page/home/state.dart';

import '../../common/api/emby/index.dart';
import '../../generated/l10n.dart';
part 'view_model.g.dart';

@riverpod
class HomeVM extends _$HomeVM {
  @override
  HomeState build() => HomeState.initial();

  final embySiteBox = objectboxHelper.store.box<EmbySite>();

  Future<void> addSite() async {
    final String host = state.hostController.text;
    final String portText = state.portController.text;
    final String username = state.usernameController.text;
    final String password = state.passwordController.text;
    if(host.isEmpty || portText.isEmpty || username.isEmpty){
      SmartDialog.showToast('请填写完整信息');
      return;
    }
    final int? port = int.tryParse(portText);
    if (port == null) {
      SmartDialog.showToast('端口号必须是整数');
      return;
    }

    EmbySite site = EmbySite(
      host: host,
      port: port,
      username: username,
      password: password,
    );
    site = await LoginApi.login(site);
    site = await LoginApi.publicInfo(site);

    embySiteBox.putAsync(site).then((id){
      SmartDialog.dismiss();
      SmartDialog.showToast('添加成功✅');
      state.sites.add(site);
      ref.invalidateSelf();
      state.hostController.clear();
      state.portController.clear();
      state.usernameController.clear();
      state.passwordController.clear();
    });
  }

  Future<void> removeSite(EmbySite site) async {
    embySiteBox.remove(site.id);
    state.sites.remove(site);
    ref.invalidateSelf();
    SmartDialog.showToast('删除成功✅');
  }

  Future<void> openDialog() async {
    await SmartDialog.show(
      useSystem: true,
      animationType: SmartAnimationType.centerFade_otherSlide,
      builder: (BuildContext context) {
        return AlertDialog(
            title: Text(S.of(context).addServer),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            content: ConstrainedBox(
                constraints: const BoxConstraints(
                  minWidth: 800,
                ),
              child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      TextField(
                        controller: state.hostController,
                        decoration: InputDecoration(
                          labelText: S.of(context).hostAddress,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        controller: state.portController,
                        decoration: InputDecoration(
                          labelText: S.of(context).port,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        controller: state.usernameController,
                        decoration: InputDecoration(
                          labelText: S.of(context).username,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        controller: state.passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: S.of(context).password,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          // suffixIcon: IconButton(
                          //   icon: Icon(
                          //     _passwordVisible ? Icons.visibility : Icons.visibility_off,
                          //   ),
                          //   onPressed: () {
                          //     _passwordVisible = !_passwordVisible;
                          //   },
                          // ),
                        ),
                      ),
                    ],
                  ),
              )
            ),
            actions: [
              TextButton(
                onPressed: () {
                  SmartDialog.dismiss();
                },
                child: Text(S.of(context).cancel),
              ),
              TextButton(
                onPressed: () {
                  addSite();
                },
                child: Text(S.of(context).confirm),
              ),
            ],
        );
      },
    );
  }
}