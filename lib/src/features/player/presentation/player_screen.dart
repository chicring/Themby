


import 'package:flutter/material.dart';

import 'horizontal_player.dart';

class PlayerScreen extends StatelessWidget {

  const PlayerScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return const Scaffold(
      body: HorizontalPlayer(),
    );
  }
}