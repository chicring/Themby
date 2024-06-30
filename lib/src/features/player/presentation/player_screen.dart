


import 'package:flutter/material.dart';

import 'horizontal_player.dart';

class PlayerScreen extends StatelessWidget {

  const PlayerScreen({super.key, required this.id, required this.type, this.index = 0});
  final String id;
  final String type;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(0),
      margin: const EdgeInsets.all(0),
      child: HorizontalPlayer(id: id, type: type),
    );
  }
}