


import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:themby/src/common/constants.dart';
import 'package:themby/src/features/player/constants.dart';
import 'package:themby/src/features/player/service/controls_service.dart';

class ToggleRateButton extends ConsumerWidget{
  const ToggleRateButton({super.key, this.size = 30, this.color = Colors.white});

  final double size;
  final Color color;


  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final rate = ref.watch(controlsServiceProvider).rate;


    return TextButton(
        child: Text('${rate}x', style: StyleString.titleStyle.copyWith(color: color,)),
        onPressed: () async {
          SmartDialog.show(
            tag: TagsString.rateSheetDialog,
            alignment: Alignment.centerRight,
            maskColor: Colors.transparent,
            builder: (context) => _rateSheet(rate)
          );
        }
    );
  }
}

Widget _rateSheet(double rate){
  return Consumer(builder: (context, ref, child){
    return Container(
      width: 200,
      color: Colors.black.withOpacity(0.85),
      child: SingleChildScrollView(
        child: Column(
          children: [
            for(int i = 0; i < TagsString.rateList.length; i++)
              TextButton(
                  child: Text(
                      '${TagsString.rateList[i]}x',
                      style: StyleString.titleStyle.copyWith(color: rate == TagsString.rateList[i] ? Colors.redAccent : Colors.white,)
                  ),
                  onPressed: () async {
                    ref.read(controlsServiceProvider.notifier).setRate(TagsString.rateList[i]);
                    SmartDialog.dismiss(tag: TagsString.rateSheetDialog);
                  }
              )
          ],
        ),
      ),
    );
  });
}

