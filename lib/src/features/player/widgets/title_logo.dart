
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

    return item.when(
        data: (value) => Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
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
                      height: height * 0.13,
                      imageBuilder: (context, imageProvider) => Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image(
                            image: imageProvider,
                            height: height * 0.13,
                          ),
                          const SizedBox(width: 5),
                          if(value.type == "Episode")
                            SizedBox(
                              width: 300,
                              child: Text(
                                  'S${value.parentIndexNumber}E${value.indexNumber} - ${value.name}',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(color: Colors.white,fontSize: 12)
                              ),
                            ),
                        ],
                      ),
                      errorWidget: (_,__,___) =>
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  truncateText(value.seriesName ?? value.name ?? '', 10),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.white)
                              ),
                              const SizedBox(height: 5),
                              if(value.type == "Episode")
                                SizedBox(
                                  width: 300,
                                  child: Text(
                                      'S${value.parentIndexNumber}E${value.indexNumber} - ${value.name}',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(color: Colors.white,fontSize: 12)
                                  ),
                                ),
                            ],
                          )
                    ),

                  ],
                ),
              ],
            ),
            const SizedBox(height: 8),
            const InternetSpeedChip(),
          ],
        ),
        error: (_,__) => const SizedBox(),
        loading: () => const SizedBox()
    );
  }
}