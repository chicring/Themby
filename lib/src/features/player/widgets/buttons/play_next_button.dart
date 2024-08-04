

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:themby/src/features/player/service/controls_service.dart';

class PlayNextButton extends ConsumerWidget{
  const PlayNextButton({super.key, this.size = 30, this.color = Colors.white});

  final double size;
  final Color color;


  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return IconButton(
        icon: Icon(
          Icons.skip_next_rounded,
          size: size,
          color: color,
        ),
        onPressed: () async {
          ref.read(controlsServiceProvider.notifier).playNext();
        }
    );
  }
}