import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:themby/src/helper/prefs_provider.dart';
import 'package:themby/src/common/data/constant.dart';
part 'app_setting_repository.g.dart';


class AppSetting{
  final int themeMode;
  final int customColor;

  AppSetting({
    required this.themeMode,
    required this.customColor,
  });

  AppSetting.initial(SharedPreferences prefs)
    : themeMode = prefs.getInt(Constant.themeModeKey) ?? 0,
      customColor = prefs.getInt(Constant.customColorKey) ?? 0;

  AppSetting copyWith({
    int? themeMode,
    bool? dynamicColor,
    int? customColor,
  }) {
    return AppSetting(
      themeMode: themeMode ?? this.themeMode,
      customColor: customColor ?? this.customColor,
    );
  }
}


@riverpod
class AppSettingRepository extends _$AppSettingRepository{

  @override
  AppSetting build() {
    return AppSetting.initial(ref.watch(sharedPreferencesProvider).requireValue);
  }

  Future<void> updateThemeMode(int value) async {
    final prefs = ref.watch(sharedPreferencesProvider).requireValue;
    prefs.setInt(Constant.themeModeKey, value);
    state = state.copyWith(themeMode: value);
  }

  Future<void> updateCustomColor(int value) async {
    final prefs = ref.watch(sharedPreferencesProvider).requireValue;
    prefs.setInt(Constant.customColorKey, value);
    state = state.copyWith(customColor: value);
  }

}