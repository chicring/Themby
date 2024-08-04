

import 'package:flutter/material.dart';
import 'package:themby/src/common/constants.dart';

class SettingItem extends StatelessWidget{
  const SettingItem({
    required this.title,
    required this.subtitle,
    this.onTap,
    this.trailing,
    this.leading,
    super.key,
  });

  final String title;
  final String subtitle;
  final VoidCallback? onTap;
  final Widget? trailing;
  final Widget? leading;


  @override
  Widget build(BuildContext context){

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: StyleString.safeSpace, vertical: 5),
      child: MaterialButton(
        elevation: 0,
        highlightElevation: 0,
        color: Theme.of(context).colorScheme.surfaceContainer,
        shape: RoundedRectangleBorder(
          borderRadius: StyleString.lgRadius,
        ),
        padding: const EdgeInsets.all(StyleString.safeSpace),
        onPressed: onTap,
        child: Column(
          children: [
            Row(
              children: [
                if(leading != null) leading!,
                const SizedBox(width: StyleString.safeSpace),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        subtitle,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: StyleString.safeSpace),
                if(trailing != null) trailing!,
              ],
            ),
          ],
        ),
      ),
    );
  }
}