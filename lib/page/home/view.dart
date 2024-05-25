import 'package:flutter/material.dart';

import '../../generated/l10n.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).link,style: Theme.of(context).textTheme.titleLarge),
      ),
      body: Center(
        child: Text(S.of(context).home),
      ),
    );
  }
}