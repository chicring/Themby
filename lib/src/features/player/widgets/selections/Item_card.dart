

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:themby/src/common/constants.dart';
import 'package:themby/src/common/widget/network_img_layer.dart';
import 'package:themby/src/features/emby/application/emby_common_service.dart';
import 'package:themby/src/features/emby/domain/emby/item.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({super.key, required this.item, required this.width, required this.height, this.press, this.longPress, this.longPressEnd});

  final Item item;

  final double width;

  final double height;

  final Function()? press;

  final Function()? longPress;

  final Function()? longPressEnd;

  @override
  Widget build(BuildContext context) {

    return Card(
      color: Colors.transparent,
      elevation: 0,
      margin: const EdgeInsets.all(6),
      child: InkWell(
        onTap: () {
          // GoRouter.of(context).push('/details/${item.id}');
        },
        child: Row(
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
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${item.indexNumber}. ${item.name}',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: StyleString.titleStyle.copyWith(color: Colors.white),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    tickToTimeWithSeconds(item.runTimeTicks ?? 0),
                    style: StyleString.subtitleStyle.copyWith(color: Colors.white),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

}