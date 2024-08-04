

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:themby/src/features/player/service/lock_service.dart';

class LockButton extends ConsumerWidget{
  const LockButton({super.key, this.size = 28, this.color = Colors.white});

  final double size;
  final Color color;


  @override
  Widget build(BuildContext context, WidgetRef ref) {


    final state = ref.watch(lockServiceProvider);

    return AnimatedOpacity(
      duration: const Duration(milliseconds: 300),
      opacity: state.showLockButton ? 1 : 0,
      child: IconButton(
          icon: Icon(
            state.controlsLock ? CupertinoIcons.lock : CupertinoIcons.lock_open,
            size: size,
            color: color,
          ),
          onPressed: () async {
            ref.read(lockServiceProvider.notifier).toggleLock();
          }
      ),
    );
  }
}

