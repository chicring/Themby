import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:themby/src/common/constants.dart';
import 'package:themby/src/common/domiani/Select.dart';
import 'package:themby/src/common/widget/Custom_dropdown_button2.dart';
import 'package:themby/src/features/emby/application/emby_common_service.dart';
import 'package:themby/src/features/emby/application/emby_media_service.dart';
import 'package:themby/src/features/emby/domain/emby/item.dart';



class EmbyDetailMediaSelection extends ConsumerWidget{

  const EmbyDetailMediaSelection({super.key, required this.item,});

  final Item item;

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    final List<Select> sources = getMediaStreams(item.mediaSources![0].mediaStreams!, 'Video');
    final List<Select> audios = getMediaStreams(item.mediaSources![0].mediaStreams!, 'Audio');
    final List<Select> subtitles = getMediaStreams(item.mediaSources![0].mediaStreams!, 'Subtitle');

    final valueListenable = ValueNotifier<String?>(null);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text('视频:', style: StyleString.subtitleStyle),
              const SizedBox(width: 10),
              CustomDropdownButton2(
                hint: '选择视频',
                valueListenable: valueListenable,
                dropdownItems: sources,
                onChanged: (String? value) {
                  ref.read(embyMediaServiceProvider.notifier).setMediaSourcesIndex(int.parse(value!));
                },
              ),
            ],
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              const Text('音频:', style: StyleString.subtitleStyle),
              const SizedBox(width: 10),
              CustomDropdownButton2(
                hint: '选择音频',
                valueListenable: valueListenable,
                dropdownItems: audios,
                onChanged: (String? value) {
                  ref.read(embyMediaServiceProvider.notifier).setAudioIndex(int.parse(value!));
                },
              ),
            ],
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              const Text('字幕:', style: StyleString.subtitleStyle),
              const SizedBox(width: 10),
              CustomDropdownButton2(
                hint: '选择字幕',
                valueListenable: valueListenable,
                dropdownItems: subtitles,
                onChanged: (String? value) {
                  ref.read(embyMediaServiceProvider.notifier).setSubtitleIndex(int.parse(value!));
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}