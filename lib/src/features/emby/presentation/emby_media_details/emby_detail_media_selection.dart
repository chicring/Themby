import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:themby/src/common/constants.dart';
import 'package:themby/src/common/widget/dropdown_custom.dart';
import 'package:themby/src/features/emby/domain/emby/item.dart';

class EmbyDetailMediaSelection extends ConsumerWidget{

  const EmbyDetailMediaSelection({super.key, required this.item,});

  final Item item;

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          children: [
            const Text('视频:', style: StyleString.subtitleStyle),
            const SizedBox(width: 10),
            // DropdownMenuCustom(
            //   data: getMediaStreams(mediaDetail.mediaSources[0].mediaStreams, 'Video'),
            //   initialSelection: 0,
            //   onSelected: (value) => SmartDialog.showToast(value.toString()),
            // )
          ],
        ),
        const SizedBox(height: 5),
        Row(
          children: [
            const Text('音频:', style: StyleString.subtitleStyle),
            const SizedBox(width: 10),
            // DropdownMenuCustom(
            //   data: getMediaStreams(mediaDetail.mediaSources[0].mediaStreams, 'Audio'),
            //   initialSelection: 0,
            //   onSelected: (value) => SmartDialog.showToast(value.toString()),
            // )
          ],
        ),
        const SizedBox(height: 5),
        Row(
          children: [
            const Text('字幕:', style: StyleString.subtitleStyle),
            const SizedBox(width: 10),
            // DropdownMenuCustom(
            //   data: getMediaStreams(mediaDetail.mediaSources[0].mediaStreams, 'Subtitle'),
            //   initialSelection: 0,
            //   onSelected: (value) => SmartDialog.showToast(value.toString()),
            // )
          ],
        ),
      ],
    );
  }
}