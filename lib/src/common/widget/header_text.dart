import 'package:flutter/material.dart';


class HeaderText extends StatelessWidget {
  final String text;
  const HeaderText({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: Text(text, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
    );
  }
}