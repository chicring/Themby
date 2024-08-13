

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:themby/src/common/constants.dart';
import 'package:themby/src/common/domiani/Select.dart';
import 'package:themby/src/features/emby/application/emby_common_service.dart';
import 'package:themby/src/features/emby/data/view_repository.dart';
import 'package:themby/src/features/player/constants.dart';
import 'package:themby/src/features/player/service/controls_service.dart';

class ToggleSubtitleButton extends ConsumerWidget{
  const ToggleSubtitleButton({super.key, this.size = 28, this.color = Colors.white});

  final double size;
  final Color color;


  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return IconButton(
        icon: Icon(
          Icons.subtitles_outlined,
          size: size,
          color: color,
        ),
        onPressed: () async {
          ///选择字幕的弹窗
          SmartDialog.show(
            tag: TagsString.subtitleSheetDialog,
            alignment: Alignment.centerRight,
            builder: (_) => _audioSheet(),
          );
        }
    );
  }
}

Widget _audioSheet(){
  return Consumer(builder: (context, ref, child){

    final state = ref.read(controlsServiceProvider);

    final resp = ref.watch(GetMediaProvider(state.currentMediaId!));

    return Container(
      width: 250,
      color: Colors.black.withOpacity(0.85),
      child: resp.when(
        data: (data)  {
          List<Select> audioStreams = getMediaStreams(data.mediaSources![0].mediaStreams!,'Subtitle');
          return audioStreams.isNotEmpty ?
            ListView.builder(
            itemCount: audioStreams.length,
            padding: const EdgeInsets.all(12),
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.only(bottom: 5),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey), // Set the border color
                  borderRadius: BorderRadius.circular(12), // Optional: Add border radius
                ),
                child: ListTile(
                  textColor: Colors.white,
                  titleTextStyle: StyleString.subtitleStyle,
                  title: Text(audioStreams[index].title),
                  subtitle: Text(audioStreams[index].subtitle ?? ''),
                  onTap: () async {
                    ref.read(controlsServiceProvider.notifier).toggleSubtitle(int.parse(audioStreams[index].value));
                    SmartDialog.dismiss(tag: TagsString.subtitleSheetDialog);
                  },
                ),
              );
            },
          ) : const Center(child: Text('没有可选的', style: TextStyle(color: Colors.white)));
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error,_) => const Center(child: Text('空')),
      ),
    );
  });
}