
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:themby/src/common/data/app_setting_repository.dart';
import 'package:themby/src/localization/string_hardcoded.dart';

class MineAppSettingScreen extends ConsumerWidget {
  const MineAppSettingScreen({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    final appSettig = ref.watch(appSettingRepositoryProvider);
    var color = Theme.of(context).colorScheme.primary;

    return Scaffold(
      appBar: AppBar(
        title: Text('通用'.hardcoded),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.language),
            title: Text('语言'.hardcoded),
            subtitle: Text('跟随系统'.hardcoded),
            onTap: () {

            },
          ),
          ListTile(
            leading: const Icon(Icons.contrast),
            title: Text('主题'.hardcoded),
            subtitle: Text(
                appSettig.themeMode == 0
                    ? '浅色模式'.hardcoded
                    : appSettig.themeMode == 1
                    ? '深色模式'.hardcoded
                    : '跟随系统'.hardcoded
            ),
            onTap: () async {

            },
          ),
          ListTile(
            leading: const Icon(Icons.border_color),
            title: Text('主题颜色'.hardcoded),
            trailing: Icon(Icons.circle, color: color),
            onTap: () {

            },
          ),
        ],
      )
    );
  }
}