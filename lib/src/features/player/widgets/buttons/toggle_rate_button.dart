


import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ToggleRateButton extends ConsumerWidget{
  const ToggleRateButton({super.key, this.size = 24, this.color = Colors.white});

  final double size;
  final Color color;


  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return IconButton(
        icon: Icon(
          Icons.speed_outlined,
          size: size,
          color: color,
        ),
        onPressed: () async {

        }
    );
  }
}