import 'package:flutter/material.dart';
import 'package:themby/page/mine/widget/account.dart';
import 'package:themby/page/mine/widget/appearance.dart';


class MinePage extends StatelessWidget {
  const MinePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          AccountWidget(),
          const SizedBox(height: 20),
          AppearanceWidget(),
        ],
      )
    );
  }
}