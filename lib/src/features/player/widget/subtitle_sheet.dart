

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:themby/src/common/data/emby_repository.dart';
import 'package:themby/src/common/domiani/Select.dart';
import 'package:themby/src/features/emby/data/view_repository.dart';
import 'package:themby/src/features/player/service/controls_service.dart';

class SubtitleSheet extends ConsumerWidget{
  const SubtitleSheet({super.key,required this.id});

  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final data = ref.watch(GetMediaProvider(id));

    return Container(
        width: 300,
        color: Colors.black.withOpacity(0.85),
        padding: const EdgeInsets.all(10),
        child: data.when(
          data: (data) {
            List<Select> audioStreams = getMediaStreams(data.mediaSources[0].mediaStreams, 'Subtitle');
            return ListView.builder(
              itemCount: audioStreams.length,
              itemBuilder: (context, index) {
                return SizedBox(
                  width: 160,
                  height: 90,
                  child: ListTile(
                    style: ListTileStyle.list,
                    title: Text(audioStreams[index].title, style: const TextStyle(color: Colors.white)),
                    subtitle: Text(audioStreams[index].subtitle ?? '', style: const TextStyle(color: Colors.white)),
                    onTap: (){
                      ref.read(controlsServiceProvider.notifier).toggleSubtitle(int.parse(audioStreams[index].value));
                    },
                  ),
                );
              },
            );
          },
          error: (Object error, StackTrace stackTrace) {
            return const SizedBox();
          },
          loading: () {
            return const SizedBox();

          },
        )
    );
  }
}