
import 'package:flutter/material.dart';

class LabelText extends StatelessWidget {
  final String text;

  const LabelText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {

    Color titleColor = Theme.of(context).colorScheme.primary;

    return ListTile(
      title: Text(text),
      titleTextStyle:  TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: titleColor,
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
    );
  }
}