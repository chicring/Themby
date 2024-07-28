

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:themby/src/common/constants.dart';
import 'package:themby/src/common/widget/network_img_layer.dart';
import 'package:themby/src/features/emby/application/emby_state_service.dart';
import 'package:themby/src/features/emby/data/image_repository.dart';
import 'package:themby/src/features/emby/domain/image_props.dart';
import 'package:themby/src/features/emby/domain/media.dart';
import 'package:themby/src/helper/screen_helper.dart';

class ListCardsHh extends ConsumerWidget{
  const ListCardsHh({super.key,required this.name,required this.medias,required this.onSelect});

  final String name;

  final List<Media> medias;

  final Function? onSelect;


  @override
  Widget build(BuildContext context, WidgetRef ref) {

    double cardWidth = ScreenHelper.getPortionAuto(xs: 5, sm: 4, md: 3);
    double cardHeight = cardWidth * 9 / 16;

    return Column(
      children: [
        const SizedBox(width: 10),
        Row(
          children: [
            const SizedBox(width: StyleString.safeSpace),
            Text(name, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ],
        ),
        const SizedBox(height: StyleString.safeSpace),
        Stack(
          children: [
            IgnorePointer(
              child: Opacity(
                opacity: 0.0,
                child: Container(
                    width: cardWidth,
                    margin: const EdgeInsets.only(
                      left: StyleString.safeSpace,
                    ),
                    child: Column(
                      children: [
                        MediaCardH(
                          media: medias.first,
                        ),
                        const SizedBox(height: 2),
                      ],
                    )
                ),
              ),
            ),
            const SizedBox(width: double.infinity),
            Positioned.fill(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: medias.length,
                  padding: const EdgeInsets.only(left: StyleString.safeSpace),
                  itemBuilder: (context, index) {
                    return Container(
                      width: cardWidth,
                      height: cardHeight,
                      margin: const EdgeInsets.only(
                        right: StyleString.safeSpace,
                      ),
                      child: MediaCardH(
                        media: medias[index],
                      ),
                    );
                  },
                )
            )
          ],
        ),
      ],
    );
  }
}


class MediaCardH extends ConsumerWidget{

  const MediaCardH({super.key, required this.media, this.longPress, this.longPressEnd});

  final Media media;

  final Function()? longPress;

  final Function()? longPressEnd;

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    final site = ref.watch(embyStateServiceProvider.select((value) => value.site));

    String getImage(Media media) {
      if(media.backdropImageTags.isNotEmpty){
        return getImageUrl(site!, media.id, ImageProps(
          quality: 90,
          type: ImageType.backdrop,
          tag: media.backdropImageTags.first,
        ));
      }else{
        return getImageUrl(site!, media.id, ImageProps(
          quality: 90,
          type: ImageType.primary,
          tag: media.imageTags.primary,
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

                      if(media.userData.playbackPositionTicks != null)
                        Positioned(
                          bottom: 0,
                          child: SizedBox(
                            width: maxWidth,
                            child: LinearProgressIndicator(
                              value: media.userData.playedPercentage! / 100,
                              backgroundColor: Colors.grey.withOpacity(0.5),
                            ),
                          ),
                        ),

                      if(media.userData.played ?? false)
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
        children: [
          Text(
            'S${media.parentIndexNumber}E${media.indexNumber} - ${media.name}',
            maxLines: 1,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
          )
        ],
      ),
    );
  }
}