
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:themby/src/common/data/subtitle_setting.dart';
import 'package:themby/src/features/mine/widgets/label_text.dart';
import 'package:themby/src/features/mine/widgets/setting_item.dart';
import 'package:themby/src/features/mine/widgets/setting_progress%20_bar.dart';

class SubtitleSettingScreen extends ConsumerWidget{
  const SubtitleSettingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('字幕外观'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const LabelText(text: "外观"),
            Container(
              constraints: const BoxConstraints(
                minHeight: 60,
                minWidth: double.infinity
              ),
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: const BoxDecoration(
                color: Color(0x88000000),
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              child: Center(
                child: Text(
                  '我是一条字幕',
                  style: ref.watch(subtitleSettingProvider).subtitleStyle,
                ),
              ),
            ),
            SettingProgressBar(
              title: "字体大小",
              min: 16,
              max: 60,
              divisions: 44,
              value: ref.read(subtitleSettingProvider).subtitleSize,
              onChange: (int value) {
                ref.read(subtitleSettingProvider).subtitleSize = value;
                ref.refresh(subtitleSettingProvider);
              },
            ),
            SettingItem(
                leading: const Icon(Icons.format_bold_rounded),
                title: const Text("粗体字幕文本"),
                subtitle: const Text("字幕使用粗体"),
                trailing: Switch(
                  value: ref.watch(subtitleSettingProvider).subtitleBold,
                  onChanged: (value) {
                    ref.read(subtitleSettingProvider).subtitleBold = value;
                    ref.refresh(subtitleSettingProvider);
                  },
                ),
                onTap: () {
                  ref.read(subtitleSettingProvider).subtitleBold = !ref.read(subtitleSettingProvider).subtitleBold;
                  ref.refresh(subtitleSettingProvider);
                },
            ),
          ],
        ),
      ),
    );
  }
}