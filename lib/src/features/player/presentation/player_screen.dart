


import 'package:flutter/material.dart';
import 'package:themby/src/common/domiani/play_info.dart';

import 'horizontal_player.dart';

class PlayerScreen extends StatelessWidget {

  const PlayerScreen({super.key, required this.playInfo});

  final PlayInfo playInfo;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(0),
      margin: const EdgeInsets.all(0),
      child: HorizontalPlayer(playInfo: playInfo),
    );
  }
}