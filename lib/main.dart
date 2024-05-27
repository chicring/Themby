import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:themby/common/provider/appearance_provider.dart';
import 'package:themby/common/state/appearance_state.dart';
import 'package:themby/common/theme/theme.dart';
import 'package:themby/generated/l10n.dart';
import 'package:dynamic_color/dynamic_color.dart';

import 'package:flutter/material.dart';
import 'package:themby/router/router.dart';

import 'common/init_app.dart';
import 'common/models/common/color_type.dart';
import 'common/widget/common/custom_dialog.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  intiApp().then((value) => runApp(const ProviderScope(child: MyApp())));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return Consumer(
        builder: (context, ref, child){
          AppearanceState appearanceState = ref.watch(appearanceVMProvider);

          return DynamicColorBuilder(
              builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic){
                ColorScheme? lightColorScheme;
                ColorScheme? darkColorScheme;

                //主题色
                Color defaultColor = colorThemeTypes[appearanceState.customColor]['color'];

                //动态颜色
                bool isDynamicColor = appearanceState.dynamicColor;

                if (lightDynamic != null && darkDynamic != null && isDynamicColor) {
                  // dynamic取色成功
                  (lightColorScheme, darkColorScheme) = generateDynamicColourSchemes(lightDynamic, darkDynamic);

                } else {
                  // dynamic取色失败，采用品牌色
                  lightColorScheme = ColorScheme.fromSeed(
                    seedColor: defaultColor,
                  );
                  darkColorScheme = ColorScheme.fromSeed(
                    seedColor: defaultColor,
                    brightness: Brightness.dark,
                  );
                }

                return MaterialApp.router(
                  debugShowCheckedModeBanner: false,
                  routerConfig: CustomNavigationHelper.router,
                  localizationsDelegates: const [
                    S.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],
                  supportedLocales: [
                    ...S.delegate.supportedLocales,
                  ],
                  themeMode: [
                    ThemeMode.light,
                    ThemeMode.dark,
                    ThemeMode.system
                  ][appearanceState.themeMode],
                  theme: buildLightTheme(lightColorScheme),
                  darkTheme: buildDarkTheme(darkColorScheme),
                  builder: FlutterSmartDialog.init(
                    toastBuilder: (String message) => CustomToastWidget(message: message),
                  ),
                );
              }
          );
        }
    );
  }
}



