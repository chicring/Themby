

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:themby/src/common/constants.dart';

class TopControl extends ConsumerStatefulWidget {
  const TopControl({super.key});

  @override
  ConsumerState<TopControl> createState() => _TopControl();
}

class _TopControl extends ConsumerState<TopControl>{

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      color: Colors.transparent,
      padding:  const EdgeInsets.all(StyleString.safeSpace),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(

          ),
          Container(
            decoration: BoxDecoration(
              color: const Color(0x66000000),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                IconButton(
                    icon: Icon(
                      Icons.fit_screen,
                      size: 24,
                      color: Colors.white,
                    ),
                    onPressed: () {

                    }
                ),
                IconButton(
                    icon: Icon(
                      Icons.subtitles,
                      size: 24,
                      color: Colors.white,
                    ),
                    onPressed: () {

                    }
                ),
                IconButton(
                    icon: Icon(
                      Icons.music_note,
                      size: 24,
                      color: Colors.white,
                    ),
                    onPressed: () {

                    }
                ),
                IconButton(
                    icon: Icon(
                      Icons.videocam,
                      size: 24,
                      color: Colors.white,
                    ),
                    onPressed: () {

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