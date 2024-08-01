
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:themby/src/common/widget/network_img_layer.dart';
import 'package:themby/src/features/emby/data/view_repository.dart';
import 'package:themby/src/features/player/service/controls_service.dart';

class TitleLogo extends ConsumerWidget{
  const TitleLogo({super.key});


  @override
  Widget build(BuildContext context, WidgetRef ref) {

    String id = ref.watch(controlsServiceProvider).currentMediaId
        ?? ref.watch(controlsServiceProvider).mediaId
        ?? '';

    final item = ref.watch(GetMediaProvider(id));

    final double height = MediaQuery.sizeOf(context).height;

    return item.when(
        data: (value) => Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if(value.imagesCustom!.logo.isNotEmpty)
              NetworkImgLayer(
                imageUrl: value.imagesCustom!.logo,
                width: height * 0.3,
                height: height * 0.15,
              ),
            if(value.type == "Episode")
              Text('S${value.parentIndexNumber}E${value.indexNumber} - ${value.name}', style: const TextStyle(color: Colors.white)),
          ],
        ),
        error: (_,__) => const SizedBox(),
        loading: () => const SizedBox()
    );
  }
}