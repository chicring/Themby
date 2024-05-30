import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'prefs_provider.g.dart';

@Riverpod(keepAlive: true)
SharedPreferences sharedPreferences(SharedPreferencesRef ref) {
  return ref.watch(sharedPreferencesInitProvider).requireValue;
}

@Riverpod(keepAlive: true)
Future<SharedPreferences> sharedPreferencesInit(SharedPreferencesInitRef ref) async {
  return await SharedPreferences.getInstance();
}