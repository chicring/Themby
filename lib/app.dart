import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_displaymode/flutter_displaymode.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:media_kit/media_kit.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:themby/src/common/data/app_setting_repository.dart';
import 'package:themby/src/common/domiani/color_type.dart';
import 'package:themby/src/common/widget/custom_dialog.dart';
import 'package:themby/src/helper/objectbox_provider.dart';
import 'package:themby/src/helper/prefs_provider.dart';
import 'package:themby/src/router/app_router.dart';
import 'package:themby/src/helper/device_info_provider.dart';
part 'app.g.dart';


@Riverpod(keepAlive: true)
Future<void> appStartup(AppStartupRef ref) async {
  // WidgetsFlutterBinding.ensureInitialized();

  await ref.read(deviceNameProvider.notifier).initDeviceName();

  if (Platform.isAndroid){
    await FlutterDisplayMode.setHighRefreshRate();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarDividerColor: Colors.transparent,
      statusBarColor: Colors.transparent,
    ));
  }
  MediaKit.ensureInitialized();
}

class App extends ConsumerWidget{
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final startup = ref.watch(appStartupProvider);

    if(startup.isLoading){
      print("Loading");
    }

    return MaterialApp.router(
      routerConfig: ref.watch(goRouterProvider),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: colorType[ref.watch(appSettingRepositoryProvider).customColor],
            brightness: Brightness.light,
            inverseSurface: Colors.grey.shade200,
            onInverseSurface: Colors.grey.shade100,
        ),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: colorType[ref.watch(appSettingRepositoryProvider).customColor],
            brightness: Brightness.dark,
            inverseSurface: Colors.black87,
            onInverseSurface: Colors.black26,
        ),
        useMaterial3: true,
      ),
      themeMode: [
        ThemeMode.light,
        ThemeMode.dark,
        ThemeMode.system,
      ][ref.watch(appSettingRepositoryProvider).themeMode],
      builder: FlutterSmartDialog.init(
        toastBuilder: (String message) => CustomToastWidget(message: message),
      ),
    );
  }
}