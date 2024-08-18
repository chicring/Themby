

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:themby/src/common/data/player_setting.dart';
import 'package:themby/src/features/emby/data/play_repository.dart';
import 'package:themby/src/features/mine/widgets/label_text.dart';
import 'package:themby/src/features/mine/widgets/setting_item.dart';
import 'package:themby/src/features/mine/widgets/setting_progress%20_bar.dart';

class SettingPlayerScreen extends ConsumerWidget{
  const SettingPlayerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
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
              subtitle: const Text("水平滑动调整视频进度,  待做..."),
              trailing: Switch(
                value: true,
                onChanged: (value) {},
              )
            ),
            SettingItem(
              leading: const Icon(Icons.swipe_vertical),
                title: const Text("滑动手势"),
                subtitle: const Text("垂直滑动调整音量和亮度, 待做..."),
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
                  value: ref.watch(playerSettingProvider).doubleClickToPause,
                  onChanged: (value) {
                    ref.read(playerSettingProvider).doubleClickToPause = value;
                    ref.refresh(playerSettingProvider);
                  },
                ),
                onTap: () {
                  ref.read(playerSettingProvider).doubleClickToPause = !ref.read(playerSettingProvider).doubleClickToPause;
                  ref.refresh(playerSettingProvider);
                },
            ),
            SettingItem(
              leading: const Icon(Icons.swap_horiz),
                title: const Text("双击快进快退"),
                subtitle: const Text("双击屏幕两侧快进快退"),
                trailing: Switch(
                  value: ref.watch(playerSettingProvider).doubleClickToJump,
                  onChanged: (value) {
                    ref.read(playerSettingProvider).doubleClickToJump = value;
                    ref.refresh(playerSettingProvider);
                  },
                ),
                onTap: () {
                  ref.read(playerSettingProvider).doubleClickToJump = !ref.read(playerSettingProvider).doubleClickToJump;
                  ref.refresh(playerSettingProvider);
                },
            ),
            SettingProgressBar(
              title: "快进时间(秒)",
              min: 5,
              max: 60,
              divisions: 10,
              value: ref.read(playerSettingProvider).fastForwardTime,
              onChange: (int value) {
                ref.read(playerSettingProvider).fastForwardTime = value;
              },
            ),
            SettingProgressBar(
              title: "快退时间(秒)",
              min: 5,
              max: 60,
              divisions: 10,
              value: ref.read(playerSettingProvider).fastRewindTime,
              onChange: (int value) {
                ref.read(playerSettingProvider).fastRewindTime = value;
              },
            ),
            SettingItem(
                leading: const Icon(Icons.touch_app),
                title: const Text("长按手势"),
                subtitle: const Text("长按屏幕倍速播放"),
                trailing: Switch(
                  value: ref.watch(playerSettingProvider).longPressSpeed,
                  onChanged: (value) {
                    ref.read(playerSettingProvider).longPressSpeed = value;
                    ref.refresh(playerSettingProvider);
                  },
                ),
                onTap: () {
                  ref.read(playerSettingProvider).longPressSpeed = !ref.read(playerSettingProvider).longPressSpeed;
                  ref.refresh(playerSettingProvider);
                }
            ),
            const LabelText(text: "界面"),
            SettingItem(
              leading: const Icon(Icons.swap_vert),
                title: const Text("显示缓冲速度"),
                subtitle: const Text("待做..."),
                trailing: Switch(
                  value: true,
                  onChanged: (value) {},
                )
            ),
            SettingItem(
              leading: const Icon(Icons.timer),
                title: const Text("显示时间"),
                subtitle: const Text("待做..."),
                trailing: Switch(
                  value: true,
                  onChanged: (value) {},
                )
            ),
            const LabelText(text: "控制", subtitle: "mpv设置"),
            SettingItem(
                leading: const Icon(Icons.hardware),
                title: const Text("启用硬解"),
                subtitle: const Text("启用 mpv 播放器硬解"),
                trailing: Switch(
                  value: ref.watch(playerSettingProvider).mpvHardDecoding,
                  onChanged: (value) {
                    ref.read(playerSettingProvider).mpvHardDecoding = value;
                    ref.refresh(playerSettingProvider);
                  },
                ),
                onTap: () {
                  ref.read(playerSettingProvider).mpvHardDecoding = !ref.read(playerSettingProvider).mpvHardDecoding;
                  ref.refresh(playerSettingProvider);
                },
            ),
            const LabelText(text: "播放器缓存", subtitle: "设置播放器缓存大小",),
            SettingProgressBar(
              title: "视频缓存大小(MB)",
              min: 64,
              max: 512,
              divisions: 16,
              value: ref.read(playerSettingProvider).mpvBufferSize,
              onChange: (int value) {
                ref.read(playerSettingProvider).mpvBufferSize = value;
                ref.refresh(playerSettingProvider);
              },
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}