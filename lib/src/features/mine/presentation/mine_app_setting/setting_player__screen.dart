

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:themby/src/features/mine/widgets/label_text.dart';
import 'package:themby/src/features/mine/widgets/setting_item.dart';

class SettingPlayerScreen extends ConsumerWidget{
  const SettingPlayerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            SmartDialog.dismiss();
          },
        ),
        title: const Text('播放器'),
        titleSpacing: 0,
      ),
      body:  SingleChildScrollView(
        child: Column(
          children: [
            const LabelText(text: "手势"),
            SettingItem(
              leading: const Icon(Icons.swipe),
              title: const Text("定位手势"),
              subtitle: const Text("水平滑动调整视频进度"),
              trailing: Switch(
                value: true,
                onChanged: (value) {},
              )
            ),
            SettingItem(
              leading: const Icon(Icons.swipe_vertical),
                title: const Text("滑动手势"),
                subtitle: const Text("垂直滑动调整音量和亮度"),
                trailing: Switch(
                  value: true,
                  onChanged: (value) {},
                )
            ),
            SettingItem(
                leading: const Icon(Icons.ads_click),
                title: const Text("双击暂停"),
                subtitle: const Text("双击屏幕中间暂停"),
                trailing: Switch(
                  value: true,
                  onChanged: (value) {},
                )
            ),
            SettingItem(
              leading: const Icon(Icons.swap_horiz),
                title: const Text("双击快进快退"),
                subtitle: const Text("双击屏幕两侧快进快退"),
                trailing: Switch(
                  value: true,
                  onChanged: (value) {},
                )
            ),
            SettingItem(
                leading: const Icon(Icons.touch_app),
                title: const Text("长按手势"),
                subtitle: const Text("长按屏幕倍速播放"),
                trailing: Switch(
                  value: true,
                  onChanged: (value) {},
                )
            ),
            const LabelText(text: "界面"),
            SettingItem(
              leading: const Icon(Icons.swap_vert),
                title: const Text("显示缓冲速度"),
                trailing: Switch(
                  value: true,
                  onChanged: (value) {},
                )
            ),
            SettingItem(
              leading: const Icon(Icons.timer),
                title: const Text("显示时间"),
                trailing: Switch(
                  value: true,
                  onChanged: (value) {},
                )
            ),
            const LabelText(text: "控制"),
            SettingItem(
                leading: const Icon(Icons.hardware),
                title: const Text("启用硬解"),
                trailing: Switch(
                  value: true,
                  onChanged: (value) {},
                )
            ),
          ],
        ),
      ),
    );
  }
}