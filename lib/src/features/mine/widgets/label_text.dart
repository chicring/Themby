
import 'package:flutter/material.dart';

class LabelText extends StatelessWidget {
  final String text;
  final String? subtitle;
  const LabelText({super.key, required this.text,this.subtitle});

  @override
  Widget build(BuildContext context) {

    Color titleColor = Theme.of(context).colorScheme.primary;

    return ListTile(
      title: Text(text),
      subtitle: subtitle != null ? Text(subtitle!) : null,
      titleTextStyle:  TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: titleColor,
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
    );
  }
}