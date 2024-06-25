


import 'package:flutter/material.dart';

import 'horizontal_player.dart';

class PlayerScreen extends StatelessWidget {

  const PlayerScreen({super.key, required this.id, required this.type});
  final String id;
  final String type;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HorizontalPlayer(
        id: id,
        type: type,
      ),
    );
  }
}