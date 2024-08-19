import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:themby/src/common/constants.dart';
import 'package:themby/src/common/data/sync_setting.dart';
import 'package:themby/src/features/home/data/site_repository.dart';
import 'package:themby/src/features/mine/widgets/label_text.dart';
import 'package:themby/src/features/mine/widgets/setting_item.dart';

import 'sync_setting_dialog.dart';

class SyncSettingScreen extends ConsumerWidget {
  const SyncSettingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('同步设置'),
        titleSpacing: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const LabelText(text: "webdav 配置", subtitle: "同步站点配置"),

            SettingItem(
              leading: const Icon(Icons.sync),
              title: const Text("开启站点同步"),
              subtitle: const Text("webdav"),
              trailing: Switch(
                value: ref.watch(syncSettingProvider).enableSync,
                onChanged: (value) {
                  ref.read(syncSettingProvider).enableSync = value;
                  ref.refresh(syncSettingProvider);
                },
              ),
              onTap: () {
                ref.read(syncSettingProvider).enableSync = !ref.read(syncSettingProvider).enableSync;
                ref.refresh(syncSettingProvider);
              },
            ),
            SettingItem(
              leading: const Icon(Icons.cloud_outlined),
              title: const Text("WebDav 配置"),
              subtitle: const Text("配置"),
              onTap: () {
                SmartDialog.show(
                  alignment: Alignment.centerRight,
                  builder: (context) {
                    return const SyncSettingDialog();
                  },
                );
              },
            ),

            SettingItem(
              leading: const Icon(Icons.format_color_text_outlined),
              title: const Text("自动同步"),
              subtitle: const Text("启动应用时，自动同步一次"),
              trailing: Switch(
                value: ref.watch(syncSettingProvider).autoSync,
                onChanged: (value) {
                  ref.read(syncSettingProvider).autoSync = value;
                  ref.refresh(syncSettingProvider);
                },
              ),
              onTap: () {
                ref.read(syncSettingProvider).autoSync = !ref.read(syncSettingProvider).autoSync;
                ref.refresh(syncSettingProvider);
              },
            ),

            const SizedBox(height: 16),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              width: double.infinity,
              child: MaterialButton(
                height: 50,
                elevation: 0,
                color: Theme.of(context).colorScheme.primary,
                textColor: Theme.of(context).colorScheme.onPrimary,
                shape: RoundedRectangleBorder(
                  borderRadius: StyleString.lgRadius,
                ),
                child: const Text('开始同步'),
                onPressed: () async{
                  bool result = await ref.read(syncSiteProvider.future);
                  if (result) {
                    SmartDialog.showToast('同步成功');
                  } else {
                    SmartDialog.showToast('同步失败');
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}



