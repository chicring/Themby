import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:themby/src/common/data/app_setting_repository.dart';
import 'package:themby/src/common/domiani/color_type.dart';
import 'package:themby/src/common/widget/custom_dialog.dart';
import 'package:themby/src/helper/prefs_provider.dart';
import 'package:themby/src/router/app_router.dart';

part 'app.g.dart';


@Riverpod(keepAlive: true)
Future<void> appStartup(AppStartupRef ref) async {
  await ref.read(sharedPreferencesInitProvider.future);
  if (Platform.isAndroid){
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarDividerColor: Colors.transparent,
      statusBarColor: Colors.transparent,
    ));
  }
}

class App extends ConsumerWidget{
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final startup = ref.watch(appStartupProvider);
    return switch (startup) {
      AsyncData() => MaterialApp.router(
        routerConfig: ref.watch(goRouterProvider),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: colorType[ref.watch(appSettingRepositoryProvider).customColor],
              brightness: Brightness.light
          ),
          useMaterial3: true,
        ),
        darkTheme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: colorType[ref.watch(appSettingRepositoryProvider).customColor],
              brightness: Brightness.dark
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
      ),
      _ => const SizedBox()
    };
  }
}