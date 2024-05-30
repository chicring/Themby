import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:themby/src/common/data/app_setting_repository.dart';
import 'package:themby/src/common/widget/custom_dialog.dart';
import 'package:themby/src/router/app_router.dart';


Future<void> main() async {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goRouter = ref.watch(goRouterProvider);
    final appSetting = ref.watch(appSettingRepositoryProvider);
    return MaterialApp.router(
      routerConfig: goRouter,
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: [
        ThemeMode.light,
        ThemeMode.dark,
        ThemeMode.system,
      ][appSetting.themeMode],
      builder: FlutterSmartDialog.init(
        toastBuilder: (String message) => CustomToastWidget(message: message),
      ),
    );
  }
}