
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shimmer/shimmer.dart';
import 'package:themby/src/common/widget/header_text.dart';
import 'package:themby/src/features/emby/application/emby_state_service.dart';
import 'package:themby/src/features/emby/data/image_repository.dart';
import 'package:themby/src/features/emby/data/view_repository.dart';
import 'package:themby/src/features/emby/domain/image_props.dart';
import 'package:themby/src/features/emby/domain/media.dart';

class EmbyResumeMedia extends ConsumerWidget{
  const EmbyResumeMedia({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final site = ref.watch(embyStateServiceProvider.select((value) => value.site));
    final medias = ref.watch(getResumeMediaProvider());

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
          tag: media.imageTags.values.first,
        ));
      }
    }

    return medias.when(
        data: (data) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(width: 12),
              const Row(
                children: [
                  HeaderText(text: '继续观看'),
                ],
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 100 + 55,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    final media = data[index];
                    return Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: (){
                          // SmartDialog.showToast(item.name);
                        },
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: CachedNetworkImage(
                                  height: 110,
                                  width: 210,
                                  imageUrl: getImage(media),
                                  fit: BoxFit.cover,
                                  placeholder: (_,__) => Shimmer.fromColors(
                                    baseColor: Colors.black26,
                                    highlightColor: Colors.black12,
                                    child: Container(
                                      color: Colors.black,
                                      height: 100,
                                      width: 200,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 4),
                            SizedBox(
                              width: MediaQuery.of(context).size.height * 0.23,
                              child: Column(
                                children: [
                                  media.type == 'Movie' ?
                                  Text(
                                    media.name,
                                    maxLines: 1,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                      : Text(
                                    media.seriesName,
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
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          );
        },
        error: (error, stack) => Center(child: Text(error.toString())),
        loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}