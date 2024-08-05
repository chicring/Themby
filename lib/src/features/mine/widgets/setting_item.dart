

import 'package:flutter/material.dart';
import 'package:themby/src/common/constants.dart';
import 'package:themby/src/localization/string_hardcoded.dart';

class SettingItem extends StatelessWidget{
  const SettingItem({
    required this.title,
    this.subtitle,
    this.onTap,
    this.trailing,
    this.leading,
    super.key,
  });

  final Widget title;
  final Widget? subtitle;
  final Widget? trailing;
  final Widget? leading;
  final VoidCallback? onTap;


  @override
  Widget build(BuildContext context){
    Color iconColor = Theme.of(context).colorScheme.secondary;
    Color titleColor = Theme.of(context).colorScheme.onSurface;

    return ListTile(
      leading: leading,
      title: title,
      subtitle: subtitle,
      onTap: () {
        onTap?.call();
      },
      iconColor: iconColor,
      titleTextStyle:  TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: titleColor,
      ),
      subtitleTextStyle:  TextStyle(
          fontSize: 15,
          color: iconColor,
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6)
    );
  }
}