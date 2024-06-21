import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:themby/src/common/constants.dart';
import 'package:themby/src/common/widget/badge.dart';
import 'package:themby/src/common/widget/network_img_layer.dart';
import 'package:themby/src/features/emby/application/emby_state_service.dart';
import 'package:themby/src/features/emby/data/image_repository.dart';
import 'package:themby/src/features/emby/domain/image_props.dart';
import 'package:themby/src/features/emby/domain/media.dart';

class MediaCardV extends ConsumerWidget{

  const MediaCardV({super.key, required this.media, this.longPress, this.longPressEnd});

  final Media media;

  final Function()? longPress;

  final Function()? longPressEnd;

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    final site = ref.watch(embyStateServiceProvider.select((value) => value.site));

    return Card(
      elevation: 0,
      clipBehavior: Clip.hardEdge,
      margin: EdgeInsets.zero,
      color: Colors.transparent,
      child: InkWell(
        onTap: () async {
          GoRouter.of(context).push('/details/${media.id}');
        },
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: StyleString.imgRadius,
                topRight: StyleString.imgRadius,
                bottomLeft: StyleString.imgRadius,
                bottomRight: StyleString.imgRadius,
              ),
              child: AspectRatio(
                aspectRatio: 0.65,
                child: LayoutBuilder(builder: (context, boxConstraints) {
                  final double maxHeight = boxConstraints.maxHeight;
                  final double maxWidth = boxConstraints.maxWidth;
                  return Stack(
                    children: [
                      NetworkImgLayer(
                        imageUrl: getImageUrl(
                            site!,
                            media.id,
                            ImageProps(
                              tag: media.imageTags.primary,
                            )
                        ),
                        width: maxWidth,
                        height: maxHeight,
                      ),

                      if(media.userData.unplayedItemCount! > 0)
                        PBadge(
                          text: media.userData.unplayedItemCount.toString(),
                          top: 6,
                          right: 6,
                        ),

                      if(media.communityRating != '0.0')
                        PBadge(
                          text: media.communityRating.toString(),
                          bottom: 6,
                          left: 6,
                          type: 'gray',
                        )

                    ],
                  );
                }),

              ),
            ),
            MediaContent(media: media),
          ],
        ),
      ),
    );
  }
}

class MediaContent extends StatelessWidget{
  const MediaContent({super.key, required this.media});

  final Media media;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(4, 4, 0, 3),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  media.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.3,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 1),
          Text(
            media.productionYear.toString(),
            maxLines: 1,
            style: TextStyle(
              fontSize: Theme.of(context).textTheme.labelMedium!.fontSize,
              color: Theme.of(context).colorScheme.outline,
            ),
          ),
        ],
      ),
    );
  }
}