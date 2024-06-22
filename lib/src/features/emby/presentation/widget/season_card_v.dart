import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:themby/src/common/constants.dart';
import 'package:themby/src/common/widget/badge.dart';
import 'package:themby/src/common/widget/network_img_layer.dart';
import 'package:themby/src/features/emby/application/emby_state_service.dart';
import 'package:themby/src/features/emby/data/image_repository.dart';
import 'package:themby/src/features/emby/domain/image_props.dart';
import 'package:themby/src/features/emby/domain/season.dart';

class SeasonCardV extends ConsumerWidget{

  const SeasonCardV({super.key, required this.season, this.longPress, this.longPressEnd});

  final Season season;

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
          GoRouter.of(context).push('/season/${season.id}');
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
                            season.id,
                            ImageProps(
                              tag: season.imageTags.primary,
                            )
                        ),
                        width: maxWidth,
                        height: maxHeight,
                      ),

                      if(season.userData.unplayedItemCount! > 0)
                        PBadge(
                          text: season.userData.unplayedItemCount.toString(),
                          top: 6,
                          right: 6,
                        ),

                    ],
                  );
                }),

              ),
            ),
            MediaContent(season: season),
          ],
        ),
      ),
    );
  }
}

class MediaContent extends StatelessWidget{
  const MediaContent({super.key, required this.season});

  final Season season;

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
                  season.name,
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
        ],
      ),
    );
  }
}