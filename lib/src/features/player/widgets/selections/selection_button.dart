

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:themby/src/common/constants.dart';

class PlayNextButton extends ConsumerWidget{
  const PlayNextButton({super.key, this.size = 30, this.color = Colors.white});

  final double size;
  final Color color;


  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return TextButton(
      onPressed: () async {
        ///打开选集的弹窗
      },
      child: Text(
        '选集',
        style: StyleString.titleStyle.copyWith(color: Colors.white),
      ),
    );
  }
}