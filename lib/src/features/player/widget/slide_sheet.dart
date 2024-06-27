


import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class RateSheet extends ConsumerWidget {
  const RateSheet({super.key});


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ShadSheet(
      constraints: BoxConstraints(
        maxWidth: 255
      ),
      backgroundColor: Colors.black.withOpacity(0.5),
      content: Column(
        children: [
          const SizedBox(height: 10,),
          Text('倍速播放',style: TextStyle(color: Colors.white,fontSize: 16),),
          const SizedBox(height: 10,),

          const SizedBox(height: 10,),
        ],
      ),
    );
  }
}