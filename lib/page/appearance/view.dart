import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:themby/common/models/common/color_type.dart';

import 'package:themby/generated/l10n.dart';
import 'package:themby/page/appearance/widgets/select_dialog.dart';
import '../../common/provider/appearance_provider.dart';


class AppearancePage extends ConsumerWidget {
  const AppearancePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var appearanceState = ref.watch(appearanceVMProvider);
    var appearanceVM = ref.watch(appearanceVMProvider.notifier);

    var color = Theme.of(context).colorScheme.primary;

    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).appearance),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            leading: const Icon(Icons.language),
            title: Text(S.of(context).language),
            subtitle: Text(S.of(context).followTheSystem),
            onTap: () {
            },
          ),
          ListTile(
            leading: const Icon(Icons.contrast),
            title: Text(S.of(context).theme),
            subtitle: themeModeSubtitle(context, appearanceState.themeMode),
            onTap: () async {
              int? result = await showDialog(
                  context: context,
                  builder: (context) {
                    return SelectDialog<int>(
                      value: appearanceState.themeMode,
                      title: S.of(context).theme,
                      type: 0,
                      values: [
                        {'value': 0, 'title': S.of(context).lightMode},
                        {'value': 1, 'title': S.of(context).darkMode},
                        {'value': 2, 'title': S.of(context).followTheSystem},
                      ],
                    );
                  }
              );

              if (result != null) {
                appearanceVM.changeThemeMode(result);
              }
            },
          ),
          SwitchListTile(
              secondary: const Icon(Icons.border_color),
              title: Text(S.of(context).dynamicColor),
              subtitle: Text(S.of(context).dynamicColorDescription),
              // activeColor: Theme.of(context).primaryColor,
              // activeTrackColor: Theme.of(context).primaryColor.withOpacity(0.5),
              value: appearanceState.dynamicColor,
              onChanged: (v) {
                appearanceVM.changeDynamicColor(v);
              },
          ),
           ListTile(
            leading: const Icon(Icons.palette),
            title: Text(S.of(context).themeColor),
            trailing: Icon(Icons.circle, color: color),
            onTap: () async {
              int? result = await showDialog(
                context: context,
                builder: (context) {
                  return SelectDialog<int>(
                    value: appearanceState.customColor,
                    title: S.of(context).themeColor,
                    type: 1,
                    values: colorThemeTypes.map((e) {
                      int index = colorThemeTypes.indexOf(e);
                      return {
                        'value': index,
                        'color': e['color'],
                      };
                    }).toList(),
                  );
                }
              );
              if (result != null) {
                appearanceVM.changeCustomColor(result);
              }
            },
           ),

        ],
      )
    );
  }

  Widget themeModeSubtitle(BuildContext context, int themeMode) {
    switch (themeMode) {
      case 0:
        return Text(S.of(context).lightMode);
      case 1:
        return Text(S.of(context).darkMode);
      case 2:
        return Text(S.of(context).followTheSystem);
      default:
        return Text(S.of(context).followTheSystem);
    }
  }
}



