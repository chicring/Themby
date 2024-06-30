

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:themby/src/common/constants.dart';
import 'package:themby/src/features/player/service/controls_service.dart';
import 'package:themby/src/features/player/widget/media_title.dart';

class TopControl extends ConsumerStatefulWidget {
  const TopControl({super.key,required this.id});

  final String id;

  @override
  ConsumerState<TopControl> createState() => _TopControl();
}

class _TopControl extends ConsumerState<TopControl>{

  Widget customButton(IconData icon, Function() onTap){
    return IconButton(
        icon: Icon(
          icon,
          size: 24,
          color: Colors.white,
        ),
        onPressed: onTap
    );
  }


  @override
  Widget build(BuildContext context) {

    final notifier = ref.read(controlsServiceProvider.notifier);


    return SizedBox(
      width: MediaQuery.sizeOf(context).width - 36,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios_new_rounded,
                    size: 24,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  }
              ),
              MediaTitle(id: widget.id)
            ],
          ),
          Container(
            decoration: BoxDecoration(
              color: const Color(0x66000000),
              borderRadius: BorderRadius.circular(16),
            ),
            margin: const EdgeInsets.only(right: 24),
            child: Row(
              children: [
                customButton(
                  Icons.fit_screen,
                  (){
                    notifier.toggleFitType();
                  }
                ),
                customButton(
                  Icons.subtitles,
                  (){
                    SmartDialog.showToast('正在做');
                  }
                ),
                customButton(
                  Icons.music_note,
                  (){
                    SmartDialog.showToast('正在做');
                  }
                ),
                customButton(
                  Icons.videocam,
                  (){
                    SmartDialog.showToast('正在做');
                  }
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}