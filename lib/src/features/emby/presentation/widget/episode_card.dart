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

  const EpisodeCard({super.key, required this.episode, this.longPress, this.longPressEnd, this.onPress, });

  final Episode episode;

  final Function()? onPress;

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
      margin: const EdgeInsets.symmetric(vertical: 5),
      color: Colors.transparent,
      child: InkWell(
        onTap: () async {
          onPress?.call();
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
                  return Stack(
                    children: [
                      NetworkImgLayer(
                        imageUrl: getImage(episode),
                        width: maxWidth,
                        height: maxHeight,
                      ),

                      if(episode.userData.played ?? false)
                        const Positioned(
                          top: 0,
                          right: 0 ,
                          child: Icon(
                            Icons.check_circle,
                            color: Colors.green,
                          ),
                        ),
                    ],
                  );
                }),
              ),
            ),
            const SizedBox(width: 5),
            Flexible(
              fit: FlexFit.tight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                      child: Text(
                        '第${episode.indexNumber}集 - ${episode.name}',
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: StyleString.subtitleStyle.copyWith(
                          color: Colors.white,
                        ),
                      )
                  ),
                  // SizedBox(
                  //   child: Text(
                  //     '第${episode.indexNumber}集 - ${episode.name}',
                  //     maxLines: 1,
                  //     style: const TextStyle(
                  //       fontSize: 10,
                  //       color: Colors.grey,
                  //     ),
                  //   ),
                  // )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
