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

    final double width = MediaQuery.of(context).size.width;
    final double maxWidth = width * 0.7;
    final double minWidth = width * 0.1;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('视频:', style: StyleString.subtitleStyle),
              const SizedBox(width: 10),
              CustomDropdownButton2(
                hint: '选择视频',
                valueListenable: valueListenable,
                dropdownItems: sources,
                buttonWidth: maxWidth,
                buttonHeight: 28,
                buttonDecoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surfaceContainer,
                  borderRadius: BorderRadius.circular(12),
                ),
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
                buttonHeight: 28,
                // buttonWidth: maxWidth,
                dropdownWidth: maxWidth,
                buttonDecoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surfaceContainer,
                  borderRadius: BorderRadius.circular(12),
                ),
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
                buttonHeight: 28,
                buttonWidth: maxWidth,
                buttonDecoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surfaceContainer,
                  borderRadius: BorderRadius.circular(12),
                ),
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