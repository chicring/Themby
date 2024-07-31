import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:haptic_feedback/haptic_feedback.dart';
import 'package:themby/src/common/constants.dart';
import 'package:themby/src/common/widget/badge.dart';
import 'package:themby/src/common/widget/network_img_layer.dart';
import 'package:themby/src/features/emby/application/emby_state_service.dart';
import 'package:themby/src/features/emby/data/image_repository.dart';
import 'package:themby/src/features/emby/domain/emby/item.dart';
import 'package:themby/src/features/emby/domain/image_props.dart';

class MediaCardV extends ConsumerWidget{

  const MediaCardV({
    super.key,
    required this.item,
    required this.width,
    required this.height,
    this.press,
    this.longPress,
    this.longPressEnd
  });

  final Item item;

  final double width;

  final double height;

  final Function()? press;

  final Function()? longPress;

  final Function()? longPressEnd;

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    return Card(
      elevation: 0,
      clipBehavior: Clip.hardEdge,
      margin: EdgeInsets.zero,
      color: Colors.transparent,
      child: InkWell(
        onTap: () async {
          GoRouter.of(context).push('/details/${item.id}');
        },
        onLongPress: () async {
          await Haptics.vibrate(HapticsType.selection);
          if(longPress != null){
            longPress!();
          }
        },
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(
                StyleString.imgRadius,
              ),
              child: Stack(
                children: [
                  NetworkImgLayer(
                    imageUrl: item.imagesCustom!.primary,
                    width: width,
                    height: height,
                  ),
                  if(item.userData?.unplayedItemCount != null)
                    PBadge(
                      text: item.userData?.unplayedItemCount.toString(),
                      top: 6,
                      right: 6,
                    ),
                  if(item.communityRating != null)
                    PBadge(
                      text: item.communityRating?.toStringAsFixed(1),
                      bottom: 6,
                      left: 6,
                      type: 'gray',
                    ),

                  if(item.userData?.playedPercentage != null)
                    Positioned(
                      bottom: 0,
                      child: Container(
                        width: width,
                        margin: const EdgeInsets.symmetric(
                          horizontal: 2,
                        ),
                        child: LinearProgressIndicator(
                          value: (item.userData?.playedPercentage ?? 0) / 100,
                          backgroundColor: Colors.grey.withOpacity(0.5),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            SizedBox(
              width: width,
              child: MediaContent(item: item),
            ),

          ],
        ),
      ),
    );
  }
}

class MediaContent extends StatelessWidget{
  const MediaContent({super.key, required this.item});

  final Item item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(4, 3, 0, 3),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            item.name!,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.3,
            ),
          ),
          const SizedBox(height: 1),
          Text(
            item.productionYear.toString(),
            maxLines: 1,
            style: TextStyle(
              fontSize: 12,
              color: Theme.of(context).colorScheme.outline,
            ),
          ),
        ],
      ),
    );
  }
}