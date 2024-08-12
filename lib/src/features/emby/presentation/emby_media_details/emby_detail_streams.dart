

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:themby/src/common/constants.dart';
import 'package:themby/src/features/emby/application/emby_common_service.dart';
import 'package:themby/src/features/emby/domain/emby/item.dart';
import 'package:themby/src/features/emby/domain/emby/media_source.dart';
import 'package:themby/src/features/emby/domain/emby/media_stream.dart';
import 'package:themby/src/features/emby/presentation/widgets/media_stream_card.dart';

class EmbyDetailStreams extends StatelessWidget{
  const EmbyDetailStreams({super.key, this.source, required this.item});

  final Item item;
  final List<MediaSource>? source;

  @override
  Widget build(BuildContext context) {
    return source == null
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
        const SizedBox(height: 6),

        for (MediaSource mediaSource in source!)...[
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Text(
              mediaSource.path ?? '',
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '${mediaSource.container!} ${formatFileSize(mediaSource.size ?? 0)}',
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  '已添加 ${convertDateTime(item.dateCreated)}',
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 5),
          if(mediaSource.mediaStreams != null && mediaSource.mediaStreams!.isNotEmpty)
            mediaStreamListCard(mediaSource.mediaStreams),
          const SizedBox(height: 6),
        ]
      ],
    );
  }
}

Widget mediaStreamListCard(List<MediaStream>? mediaStreams) {
  return Stack(
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
            itemCount: mediaStreams.length,
            padding: const EdgeInsets.only(right: StyleString.safeSpace),
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.only(left: StyleString.safeSpace),
                child: MediaStreamCard(
                    mediaStream: mediaStreams[index]
                ),
              );
            },
          )
      )
    ],
  );
}