import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:themby/src/common/data/app_setting_repository.dart';
import 'package:themby/src/common/domiani/color_type.dart';
import 'package:themby/src/localization/string_hardcoded.dart';

part 'mine_app_setting_handle.g.dart';

/*
打开主题模式选择弹窗
 */
@riverpod
Future<void> openThemeModeDialog(OpenThemeModeDialogRef ref,{ required int currentMode}) async {
  await SmartDialog.show(
    useSystem: true,
    animationType: SmartAnimationType.centerFade_otherSlide,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("主题模式".hardcoded),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        content: ConstrainedBox(
            constraints: const BoxConstraints(
              minWidth: 600,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                    ListTile(
                      selected: currentMode == 0,
                      title: Text("浅色模式".hardcoded), // 如果选中，文字加粗
                      onTap: () {
                        ref.read(appSettingRepositoryProvider.notifier).updateThemeMode(0);
                        SmartDialog.dismiss();
                      },
                    ),
                    ListTile(
                      selected: currentMode == 1,
                      title: Text("暗色模式".hardcoded), // 如果选中，文字加粗
                      onTap: () {
                        ref.read(appSettingRepositoryProvider.notifier).updateThemeMode(1);
                        SmartDialog.dismiss();
                      },
                    ),
                    ListTile(
                      selected: currentMode == 2,
                      title: Text("跟随系统".hardcoded), // 如果选中，文字加粗
                      onTap: () {
                        ref.read(appSettingRepositoryProvider.notifier).updateThemeMode(2);
                        SmartDialog.dismiss();
                      },
                    )
              ],
            ),
        ),
      );
    },
  );
}


@riverpod
Future<void> openThemeColorDialog(OpenThemeColorDialogRef ref, {required int currentColor}) async {
  await SmartDialog.show(
    useSystem: true,
    animationType: SmartAnimationType.centerFade_otherSlide,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("主题颜色".hardcoded),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        content: ConstrainedBox(
            constraints: const BoxConstraints(
              minWidth: 600,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(
                colorType.length,
                    (index) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0), // 添加垂直间隔
                  child: InkWell(
                    onTap: () {
                      ref.read(appSettingRepositoryProvider.notifier).updateCustomColor(index);
                      SmartDialog.dismiss();
                    },
                    child: Stack(
                      children: [
                        Container(
                          height: 10,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: colorType[index],
                          ),
                        ),
                        if (currentColor == index) // 如果当前颜色被选中
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              height: 10,
                              color: Colors.black.withOpacity(0.5), // 在颜色条上添加半透明黑色覆盖层
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
        )
      );
    },
  );
}