import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:themby/src/common/constants.dart';
import 'package:themby/src/common/widget/network_img_layer.dart';
import 'package:themby/src/features/emby/application/emby_state_service.dart';
import 'package:themby/src/features/emby/data/image_repository.dart';
import 'package:themby/src/features/emby/domain/episode.dart';
import 'package:themby/src/features/emby/domain/image_props.dart';
import 'package:themby/src/features/emby/domain/media.dart';

class EpisodeCard extends ConsumerWidget{

  const EpisodeCard({super.key, required this.episode, this.longPress, this.longPressEnd});

  final Episode episode;

  final Function()? longPress;

  final Function()? longPressEnd;

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    final site = ref.watch(embyStateServiceProvider.select((value) => value.site));

    String getImage(Episode episode) {

      return getImageUrl(
          site!,
          episode.id,
          ImageProps(
            type: ImageType.primary,
            tag: episode.imageTags.primary,
          )
      );
      // if(episode.backdropImageTags.isNotEmpty){
      //   return getImageUrl(site!, episode.id, ImageProps(
      //     quality: 90,
      //     type: ImageType.backdrop,
      //     tag: episode.backdropImageTags.first,
      //   ));
      // }else{
      //   return getImageUrl(site!, episode.seasonId, ImageProps(
      //     quality: 90,
      //     type: ImageType.backdrop,
      //     tag: episode.parentBackdropImageTags.first,
      //   ));
      // }
    }

    return Card(
      elevation: 0,
      clipBehavior: Clip.hardEdge,
      margin: EdgeInsets.zero,
      color: Colors.transparent,
      child: InkWell(
        onTap: () async {

        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: StyleString.imgRadius,
                topRight: StyleString.imgRadius,
                bottomLeft: StyleString.imgRadius,
                bottomRight: StyleString.imgRadius,
              ),
              child: AspectRatio(
                aspectRatio: 16/9,
                child: LayoutBuilder(builder: (context, boxConstraints) {
                  final double maxHeight = boxConstraints.maxHeight;
                  final double maxWidth = boxConstraints.maxWidth;
                  return NetworkImgLayer(
                    imageUrl: getImage(episode),
                    width: maxWidth,
                    height: maxHeight,
                  );
                }),
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                      child: Text(
                        episode.name,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: StyleString.titleStyle,
                      )
                  ),
                  SizedBox(
                      child: Text(
                        episode.overview,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: StyleString.subtitleStyle.copyWith(color: Colors.grey),
                      )
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
