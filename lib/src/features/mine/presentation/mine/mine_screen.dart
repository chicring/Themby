
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:themby/src/features/mine/widgets/setting_item.dart';
import 'package:themby/src/localization/string_hardcoded.dart';

class MineScreen extends StatelessWidget {
  const MineScreen({super.key});

  @override
  Widget build(BuildContext context) {

    var color = Theme.of(context).colorScheme.primary;

    return Scaffold(
        appBar: AppBar(
          title: Text(
              "我的".hardcoded,
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
                leading: const Icon(Icons.color_lens_outlined),
                title: "外观".hardcoded,
                subtitle: "语言, 暗色模式，主题色".hardcoded,
                onTap: () {
                  // GoRouter.of(context).push('/app_setting');
                },
              ),
              SettingItem(
                leading: const Icon(Icons.play_circle_outline_rounded),
                title: "播放".hardcoded,
                subtitle: "语言, 暗色模式，主题色".hardcoded,
                onTap: () {
                  // GoRouter.of(context).push('/app_setting');
                },
              ),
              SettingItem(
                leading: const Icon(Icons.video_library_outlined),
                title: "媒体库".hardcoded,
                subtitle: "语言, 暗色模式，主题色".hardcoded,
                onTap: () {
                  // GoRouter.of(context).push('/app_setting');
                },
              ),
              SettingItem(
                leading: const Icon(Icons.cloud_outlined),
                title: "同步".hardcoded,
                subtitle: "语言, 暗色模式，主题色".hardcoded,
                onTap: () {
                  // GoRouter.of(context).push('/app_setting');
                },
              ),
              SettingItem(
                leading: const Icon(Icons.info_outline),
                title: "关于".hardcoded,
                subtitle: "关于我们，版本".hardcoded,
                onTap: () {
                  // GoRouter.of(context).push('/about');
                },
              ),
              SettingItem(
                leading: const Icon(Icons.info_outline),
                title: "赞助作者".hardcoded,
                subtitle: "关于我们，版本".hardcoded,
                onTap: () {
                  // GoRouter.of(context).push('/about');
                },
              ),
            ],
          ),
        )
    );
  }


}

// Card(
//     clipBehavior: Clip.antiAlias,
//     elevation: 0,
//     shape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.circular(20),
//     ),
//     child: ListView(
//       shrinkWrap: true,
//       children: [
//         ListTile(
//           enabled: false,
//           visualDensity: const VisualDensity(vertical: -4.0),
//           title: Text(
//               "通用".hardcoded,
//               style: TextStyle(
//                   fontSize: 15,
//                   fontWeight: FontWeight.bold,
//                   color: color
//               )
//           ),
//         ),
//         ListTile(
//           title: Text("通用设置".hardcoded),
//           onTap: () {
//             GoRouter.of(context).push('/app_setting');
//           },
//         ),
//       ],
//     )
// ),