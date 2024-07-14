import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:themby/src/common/constants.dart';
import 'package:themby/src/common/widget/badge.dart';
import 'package:themby/src/common/widget/network_img_layer.dart';
import 'package:themby/src/features/emby/application/emby_state_service.dart';
import 'package:themby/src/features/emby/data/image_repository.dart';
import 'package:themby/src/features/emby/domain/Resume.dart';
import 'package:themby/src/features/emby/domain/image_props.dart';
import 'package:themby/src/features/emby/domain/media.dart';

class MediaCardH extends ConsumerWidget{

  const MediaCardH({super.key, required this.media, this.longPress, this.longPressEnd});

  final Resume media;

  final Function()? longPress;

  final Function()? longPressEnd;

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    final site = ref.watch(embyStateServiceProvider.select((value) => value.site));

    String getImage(Resume media) {
      if(media.backdropImageTags.isNotEmpty){
        return getImageUrl(site!, media.id!, ImageProps(
          quality: 90,
          type: ImageType.backdrop,
          tag: media.backdropImageTags.first,
        ));
      }else{
        return getImageUrl(site!, media.id!, ImageProps(
          quality: 90,
          type: ImageType.primary,
          tag: media.imageTags?.primary,
        ));
      }
    }

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
                aspectRatio: 16/9,
                child: LayoutBuilder(builder: (context, boxConstraints) {
                  final double maxHeight = boxConstraints.maxHeight;
                  final double maxWidth = boxConstraints.maxWidth;
                  return Stack(
                    children: [
                      NetworkImgLayer(
                        imageUrl: getImage(media),
                        width: maxWidth,
                        height: maxHeight,
                      ),

                      if(media.userData?.playbackPositionTicks != null)
                        Positioned(
                          bottom: 0,
                          child: SizedBox(
                            width: maxWidth,
                            child: LinearProgressIndicator(
                              value: media.userData!.playedPercentage! / 100,
                              backgroundColor: Colors.grey.withOpacity(0.5),
                            ),
                          ),
                        ),

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

  final Resume media;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(4, 4, 0, 3),
      child: Column(
        children: [
          media.type == 'Movie' ?
          Text(
            media.name!,
            maxLines: 1,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          )
              : Text(
            media.seriesName!,
            maxLines: 1,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
          media.type == 'Movie' ?
          Text(
            media.productionYear.toString(),
            maxLines: 1,
            style: const TextStyle(
              fontSize: 10,
              color: Colors.grey,
            ),
          )
              : Text(
            'S${media.parentIndexNumber}E${media.indexNumber} - ${media.name}',
            maxLines: 1,
            style: const TextStyle(
              fontSize: 10,
              color: Colors.grey,
            ),
          )
        ],
      ),
    );
  }
}