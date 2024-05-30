import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'prefs_provider.g.dart';


@Riverpod(keepAlive: true)
Future<SharedPreferences> sharedPreferences(SharedPreferencesRef ref) async {
  return await SharedPreferences.getInstance();
}