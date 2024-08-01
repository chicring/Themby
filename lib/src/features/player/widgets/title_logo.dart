
import 'package:cached_network_image/cached_network_image.dart';
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
            CachedNetworkImage(
              imageUrl: value.imagesCustom!.logo,
              height: height * 0.1,
              errorWidget: (_,__,___) => Text(value.name!,maxLines: 1,  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
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