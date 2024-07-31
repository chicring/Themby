

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:themby/src/common/constants.dart';
import 'package:themby/src/features/emby/domain/emby/media_stream.dart';
import 'package:themby/src/features/emby/presentation/widgets/media_stream_card.dart';

class EmbyDetailStreams extends StatelessWidget{
  const EmbyDetailStreams({super.key, this.mediaStreams});

  final List<MediaStream>? mediaStreams;

  @override
  Widget build(BuildContext context) {
    return mediaStreams == null
        ? const SizedBox() :
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         const Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(width: StyleString.safeSpace),

            Text(
              '媒体信息',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Stack(
          children: [
            IgnorePointer(
              child: Opacity(
                opacity: 0.0,
                child: MediaStreamCard(mediaStream: mediaStreams!.first),
              ),
            ),
            const SizedBox(width: double.infinity),
            Positioned.fill(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: mediaStreams!.length,
                  padding: const EdgeInsets.only(right: StyleString.safeSpace),
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.only(left: StyleString.safeSpace),
                      child: MediaStreamCard(
                          mediaStream: mediaStreams![index]
                      ),
                    );
                  },
                )
            )
          ],
        ),
      ],
    );
  }

}