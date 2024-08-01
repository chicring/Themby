

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlayPreviousButton extends ConsumerWidget{
  const PlayPreviousButton({super.key, this.size = 30, this.color = Colors.white});

  final double size;
  final Color color;


  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return IconButton(
        icon: Icon(
          Icons.skip_previous_rounded,
          size: size,
          color: color,
        ),
        onPressed: () async {

        }
    );
  }
}