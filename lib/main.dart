import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:themby/app.dart';
import 'package:themby/src/helper/objectbox_provider.dart';
import 'package:themby/src/helper/prefs_provider.dart';
import 'package:path/path.dart';
import 'objectbox.g.dart';


void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  final prefs = await SharedPreferences.getInstance();
  final directory = await getApplicationDocumentsDirectory();
  final store = Store(getObjectBoxModel(), directory: join(directory.path, 'objectbox'));

  runApp(
      ProviderScope(
        overrides: [
          sharedPreferencesProvider.overrideWithValue(prefs),
          storeProvider.overrideWithValue(store)
        ],
        child: const App()
      )
  );

  Timer(const Duration(milliseconds: 500), () {
    FlutterNativeSplash.remove();
  });
}
