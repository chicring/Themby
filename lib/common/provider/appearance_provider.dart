import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:themby/common/helper/Prefs_helper.dart';
import '../state/appearance_state.dart';

part 'appearance_provider.g.dart';

@riverpod
class AppearanceVM extends _$AppearanceVM{

  @override
  AppearanceState build() => AppearanceState.initial();


  void changeThemeMode(int themeModel) async{
    state = state.copyWith(themeMode: themeModel);
    PrefsHelper.updateThemeMode(themeModel);
  }

  void changeDynamicColor(bool dynamicColor) async{
    state = state.copyWith(dynamicColor: dynamicColor);
    PrefsHelper.updateDynamicColor(dynamicColor);
  }

  void changeCustomColor(int customColor) async{
    if(state.dynamicColor){
      state = state.copyWith(customColor: customColor, dynamicColor: false);
    }else{
      state = state.copyWith(customColor: customColor);
    }
    PrefsHelper.updateCustomColor(customColor);
  }
}