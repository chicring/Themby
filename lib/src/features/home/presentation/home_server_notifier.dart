import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:themby/src/common/domiani/site.dart';
import 'package:themby/src/features/home/data/site_repository.dart';
import 'package:themby/src/features/home/domain/home_add_server_state.dart';

import 'home_add.dart';

part 'home_server_notifier.g.dart';

@riverpod
class HomeServerNotifier extends _$HomeServerNotifier{

  @override
  HomeAddServerState build() => HomeAddServerState.initial();

  Future<void> openAddDialog() async {

    await SmartDialog.show(
        alignment: Alignment.centerRight,
        builder: (_) {
          return const HomeAddSite();
        }
    );
  }


  Future<void> removeSite(Site site) async {
    await ref.read(removeEmbySiteProvider(site: site).future);

    ref.refresh(finaAllByTextProvider(text: ''));
    SmartDialog.showToast('删除成功');
  }
}


