
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:themby/src/features/mine/widgets/setting_item.dart';
import 'package:themby/src/localization/string_hardcoded.dart';

class MineScreen extends StatelessWidget {
  const MineScreen({super.key});

  @override
  Widget build(BuildContext context) {

    Color color = Theme.of(context).colorScheme.primary;

    return Scaffold(
        appBar: AppBar(
          titleSpacing: 0,
          title: Text(
              "设置".hardcoded,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: color
              )
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SettingItem(
                leading: const Icon(Icons.color_lens_rounded,size: 28),
                title: Text("外观".hardcoded),
                subtitle: Text("语言, 暗色模式，主题色".hardcoded),
                onTap: () {
                  GoRouter.of(context).push('/app_setting');
                },
              ),
              SettingItem(
                leading: const Icon(Icons.play_circle,size: 28),
                title: Text("播放器".hardcoded),
                subtitle: Text("播放器外观、手势、控件".hardcoded),
                onTap: () {
                  // GoRouter.of(context).push('/app_setting');
                },
              ),
              SettingItem(
                leading: const Icon(Icons.subtitles,size: 28),
                title: Text("字幕外观".hardcoded),
                subtitle: Text("播放选项".hardcoded),
                onTap: () {
                  // GoRouter.of(context).push('/app_setting');
                },
              ),
              SettingItem(
                leading: const Icon(Icons.video_library,size: 28),
                title: Text("媒体库".hardcoded),
                subtitle: Text("管理媒体库".hardcoded),
                onTap: () {
                  // GoRouter.of(context).push('/app_setting');
                },
              ),
              SettingItem(
                leading: const Icon(Icons.cloud,size: 28),
                title: Text("同步".hardcoded),
                subtitle: Text("语言, 暗色模式，主题色".hardcoded),
                onTap: () {
                  // GoRouter.of(context).push('/app_setting');
                },
              ),
              SettingItem(
                leading: const Icon(Icons.info,size: 28),
                title: Text("关于".hardcoded),
                subtitle: Text("关于，鸣谢".hardcoded),
                onTap: () {
                  // GoRouter.of(context).push('/about');
                },
              ),
              // SettingItem(
              //   leading: const Icon(Icons.info_outline),
              //   title: "赞助".hardcoded,
              //   subtitle: "请作者喝咖啡".hardcoded,
              //   onTap: () {
              //     // GoRouter.of(context).push('/about');
              //   },
              // ),
            ],
          ),
        )
    );
  }

}
