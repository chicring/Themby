import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:themby/src/common/constants.dart';
import 'package:themby/src/common/widget/network_img_layer.dart';
import 'package:themby/src/features/emby/application/emby_common_service.dart';
import 'package:themby/src/features/emby/domain/emby/item.dart';


class MediaCardH extends ConsumerWidget{

  const MediaCardH({super.key, required this.item, required this.width, required this.height, this.press, this.longPress, this.longPressEnd});

  final Item item;

  final double width;

  final double height;

  final Function()? press;

  final Function()? longPress;

  final Function()? longPressEnd;


  @override
  Widget build(BuildContext context,WidgetRef ref) {

    String imageUrl = "";

    if(item.type == "Episode") {
      imageUrl = (item.primaryImageAspectRatio ?? 0 ) >= 1
          ? item.imagesCustom!.primary
          : item.imagesCustom!.backdrop;
    }else{
      imageUrl = item.imagesCustom?.backdrop.isNotEmpty == true
          ? item.imagesCustom!.backdrop
          : item.imagesCustom!.primary;
    }

    return Card(
      elevation: 0,
      clipBehavior: Clip.hardEdge,
      margin: EdgeInsets.zero,
      color: Colors.transparent,
      child: InkWell(
        onTap: () async {
          GoRouter.of(context).push('/details/${item.id}');
        },
        child: Column(
          children: [
            Stack(
              children: [
                NetworkImgLayer(
                  imageUrl: formatImageUrl(url: imageUrl,width: width.toInt()),
                  width: width,
                  height: height,
                ),

                if(item.userData?.playedPercentage != null)
                  Positioned(
                    left: 8,
                    right: 8,
                    bottom: 6,
                    child: SizedBox(
                      width: width,
                      child: LinearProgressIndicator(
                        value: (item.userData?.playedPercentage ?? 0) / 100,
                        backgroundColor: Colors.grey.withOpacity(0.5),
                        borderRadius: StyleString.lgRadius,
                      ),
                    ),
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
      padding: const EdgeInsets.fromLTRB(4, 4, 0, 3),
      child: Column(
        children: [
          item.type == 'Movie' ?
          Text(
            item.name!,
            maxLines: 1,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          )
              : Text(
            item.seriesName!,
            maxLines: 1,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
          item.type == 'Movie' ?
          Text(
            item.productionYear.toString(),
            maxLines: 1,
            style: const TextStyle(
              fontSize: 10,
              color: Colors.grey,
            ),
          )
              : Text(
            'S${item.parentIndexNumber}E${item.indexNumber} - ${item.name}',
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