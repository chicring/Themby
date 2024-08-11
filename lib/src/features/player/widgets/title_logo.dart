
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:themby/src/common/widget/network_img_layer.dart';
import 'package:themby/src/features/emby/application/emby_common_service.dart';
import 'package:themby/src/features/emby/data/view_repository.dart';
import 'package:themby/src/features/player/service/controls_service.dart';

import 'internet_speed_chip.dart';

class TitleLogo extends ConsumerWidget{
  const TitleLogo({super.key});


  @override
  Widget build(BuildContext context, WidgetRef ref) {

    String id = ref.watch(controlsServiceProvider).currentMediaId
        ?? ref.watch(controlsServiceProvider).mediaId
        ?? '';

    final item = ref.watch(GetMediaProvider(id));

    final double height = MediaQuery.sizeOf(context).height;
    final double width = MediaQuery.sizeOf(context).width;


    return item.when(
        data: (value) => Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back,color: Colors.white),
              padding:  EdgeInsets.zero,
              onPressed: (){
                Navigator.pop(context);
              },
            ),
            const SizedBox(width: 6),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CachedNetworkImage(
                  imageUrl: value.imagesCustom!.logo,
                  height: height * 0.12,
                  width: width * 0.4,
                  alignment: Alignment.centerLeft,
                  httpHeaders: const {
                    'user-agent': "Themby/1.0.3",
                  },
                  errorWidget: (_,__,___) =>
                      Text(
                          truncateText(value.seriesName ?? value.name ?? '', 10),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.white)
                      ),
                ),
                const SizedBox(height: 5),
                if(value.type == "Episode")
                  SizedBox(
                    child: Text(
                        'S${value.parentIndexNumber}E${value.indexNumber} - ${value.name}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(color: Colors.white,fontSize: 12)
                    ),
                  ),
              ],
            ),
          ],
        ),
        error: (_,__) => const SizedBox(),
        loading: () => const SizedBox()
    );
  }
}