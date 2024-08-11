import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:themby/src/common/domiani/Select.dart';
import 'package:themby/src/common/widget/custom_dropdown.dart';
import 'package:themby/src/features/emby/application/emby_common_service.dart';
import 'package:themby/src/features/emby/application/emby_media_service.dart';
import 'package:themby/src/features/emby/domain/emby/item.dart';



class EmbyDetailMediaSelection extends ConsumerWidget{

  const EmbyDetailMediaSelection({super.key, required this.item,});

  final Item item;

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    final  sourcesIndex = ref.watch(embyMediaServiceProvider).mediaSourcesIndex;
    final List<Select> sources = getMediaSource(item.mediaSources!);
    final List<Select> audios = getMediaStreams(item.mediaSources![sourcesIndex??0].mediaStreams!, 'Audio');
    final List<Select> subtitles = getMediaStreams(item.mediaSources![sourcesIndex??0].mediaStreams!, 'Subtitle');

    final double width = MediaQuery.sizeOf(context).width * 0.7;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [

          if(sources.isNotEmpty) ...[
            CustomDropdown(
              hint: '版本:',
              dropdownItems: sources,
              buttonMaxWidth: width,
              onChanged: (int? value) {
                ref.read(embyMediaServiceProvider.notifier).setMediaSourcesIndex(value!);
              },
            ),
            const SizedBox(height: 5),
          ],

          if(audios.isNotEmpty) ...[
            CustomDropdown(
              hint: '音频:',
              dropdownItems: audios,
              buttonMaxWidth: width,
              onChanged: (int? value) {
                ref.read(embyMediaServiceProvider.notifier).setAudioIndex(value!);
              },
            ),
            const SizedBox(height: 5),
          ],

          if(subtitles.isNotEmpty)
            CustomDropdown(
              hint: '字幕:',
              dropdownItems: subtitles,
              buttonMaxWidth: width,
              onChanged: (int? value) {
                ref.read(embyMediaServiceProvider.notifier).setSubtitleIndex(value!);
              },
            ),
        ],
      ),
    );
  }
}