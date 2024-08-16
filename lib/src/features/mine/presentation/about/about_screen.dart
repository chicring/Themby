
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:themby/src/common/constants.dart';
import 'package:themby/src/helper/package_info.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutScreen extends ConsumerWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    Color color = Theme.of(context).colorScheme.surfaceContainerHigh;

    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0.0,
        title: const Text('About'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.center,
          children:  [
            const SizedBox(height: 12),
            Image.asset(
              'assets/images/logo_splash.png',
              width: 86,
              height: 86,
            ),
            const SizedBox(height: 8),
            const SizedBox(width: double.infinity,),
            Text(
              ref.read(packageInfoProvider).appName,
              style: StyleString.headerStyle.copyWith(fontSize: 28),
            ),
            Text(
              ref.read(packageInfoProvider).version,
              style: StyleString.titleStyle,
            ),
            const SizedBox(height: 12),
            _aboutItem(
              color,
              const Icon(Icons.sync),
              "检查应用更新",
              (){
                SmartDialog.showToast("待完善");
              }
            ),
            _aboutItem(
                color,
                const Icon(Icons.star),
                "Github",
                 (){
                    launchUrl(
                      Uri.parse("https://github.com/chicring/Themby-Release"),
                      mode: LaunchMode.externalApplication
                    );
                 }
            ),
            _aboutItem(
                color,
                const Icon(Icons.telegram_outlined),
                "Telegram 频道",
                 (){
                   launchUrl(
                     Uri.parse("https://t.me/themby_official"),
                     mode: LaunchMode.externalNonBrowserApplication
                   );
                 }
            ),
            _aboutItem(
                color,
                const Icon(Icons.local_police_outlined),
                "依赖库",
                 (){
                   SmartDialog.showToast("待完善");
                 }
            ),
            _aboutItem(
                color,
                const Icon(Icons.info_outline_rounded),
                "常见问题",
                 (){
                   SmartDialog.showToast("待完善");
                 }
            ),
            const SizedBox(height: 5),
            Text(
              "第三方emby客户端",
              style: StyleString.subtitleStyle.copyWith(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

  Widget _aboutItem(Color color, Icon icon, String text, VoidCallback onTap) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      child: Material(
        color: color,
        borderRadius: const BorderRadius.all(Radius.circular(18)),
        child: InkWell(
          borderRadius: const BorderRadius.all(Radius.circular(18)),
          onTap: onTap,
          child: ListTile(
            leading: icon,
            title: Text(text),
          ),
        ),
      ),
    );
  }
}