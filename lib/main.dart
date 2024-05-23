import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:themby/generated/l10n.dart';

import 'package:flutter/material.dart';
import 'package:themby/router/router.dart';

void main() {
  CustomNavigationHelper.instance;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
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
        const Locale('zh', ''),
        ...S.delegate.supportedLocales,
      ],
    );
  }
}



