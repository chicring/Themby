

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:themby/src/common/constants.dart';
import 'package:themby/src/common/widget/network_img_layer.dart';
import 'package:themby/src/features/emby/application/emby_common_service.dart';
import 'package:themby/src/features/emby/domain/emby/item.dart';

class EpisodeCard extends StatelessWidget {
  const EpisodeCard({super.key, required this.item, required this.width, required this.height, this.press, this.longPress, this.longPressEnd});

  final Item item;

  final double width;

  final double height;

  final Function()? press;

  final Function()? longPress;

  final Function()? longPressEnd;

  @override
  Widget build(BuildContext context) {

    // double cardWidth = ScreenHelper.getPortionAuto(xs: 5, sm: 4, md: 3);
    // double cardHeight = cardWidth * 9 / 16;

    return Card(
      color: Colors.transparent,
      elevation: 0,
      margin: const EdgeInsets.all(StyleString.safeSpace),
      child: InkWell(
        onTap: () {
          GoRouter.of(context).push('/details/${item.id}');
        },
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    NetworkImgLayer(
                      imageUrl: item.imagesCustom?.primary,
                      width: width,
                      height: height,
                    ),
                    if(item.userData?.played ?? false)
                      Positioned(
                        top: 3,
                        right: 3,
                        child: Icon(
                          Icons.check_circle,
                          color: Theme.of(context).colorScheme.primaryContainer,
                        ),
                      ),
                  ],
                ),

                const SizedBox(width: 10),
                Flexible(
                  fit: FlexFit.tight,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${item.indexNumber}. ${item.name}',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: StyleString.titleStyle,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        tickToTimeWithSeconds(item.runTimeTicks ?? 0),
                        style: StyleString.subtitleStyle.copyWith(color: Colors.grey),
                      )
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(height: 5),
            SizedBox(
                width: MediaQuery.of(context).size.width - 2 * StyleString.safeSpace,
                child: Text(
                  item.overview ?? '',
                  maxLines: 6,
                  overflow: TextOverflow.ellipsis,
                  style: StyleString.subtitleStyle.copyWith(color: Colors.grey),
                )
            ),
          ],
        ),
      ),
    );
  }

}