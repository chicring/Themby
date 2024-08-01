

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ToggleAudioButtoon extends ConsumerWidget{
  const ToggleAudioButtoon({super.key, this.size = 30, this.color = Colors.white});

  final double size;
  final Color color;


  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return IconButton(
        icon: Icon(
          Icons.audiotrack_outlined,
          size: size,
          color: color,
        ),
        onPressed: () async {

        }
    );
  }
}