

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:themby/src/features/player/service/fit_type_service.dart';

class ToggleFitButton extends ConsumerWidget{
  const ToggleFitButton({super.key, this.size = 28, this.color = Colors.white});

  final double size;
  final Color color;


  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return IconButton(
        icon: Icon(
          Icons.fit_screen,
          size: size,
          color: color,
        ),
        onPressed: () async {
          ref.read(fitTypeServiceProvider.notifier).toggleFitType();
        }
    );
  }
}

