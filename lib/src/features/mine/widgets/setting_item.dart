

import 'package:flutter/material.dart';

class SettingItem extends StatelessWidget{
  const SettingItem({
    required this.title,
    required this.subtitle,
    required this.onTap,
    this.trailing,
    this.leading,
    super.key,
  });

  final String title;
  final String subtitle;
  final VoidCallback onTap;
  final Widget? trailing;
  final Widget? leading;


  @override
  Widget build(BuildContext context){
    return MaterialButton(
      padding: const EdgeInsets.all(0),
      onPressed: onTap,
      child: Column(
        children: [
          Row(
            children: [
              if(leading != null) leading!,
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
              if(trailing != null) trailing!,
            ],
          ),
        ],
      ),
    );
  }
}