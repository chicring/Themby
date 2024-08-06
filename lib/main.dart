import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:themby/app.dart';
import 'package:themby/src/helper/objectbox_provider.dart';
import 'package:themby/src/helper/prefs_provider.dart';
import 'package:path/path.dart';
import 'loading_screen.dart';
import 'objectbox.g.dart';


void main() async {

  runApp(const LoadingScreen());

  final prefs = await SharedPreferences.getInstance();
  final directory = await getApplicationDocumentsDirectory();
  final store = Store(getObjectBoxModel(), directory: join(directory.path, 'objectbox'));

  return runApp(
      ProviderScope(
        overrides: [
          sharedPreferencesProvider.overrideWithValue(prefs),
          storeProvider.overrideWithValue(store)
        ],
        child: const App()
      )
  );
}

