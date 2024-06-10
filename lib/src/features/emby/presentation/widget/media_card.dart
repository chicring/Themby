import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:themby/src/features/emby/application/emby_state_service.dart';
import 'package:themby/src/features/emby/data/image_repository.dart';
import 'package:themby/src/features/emby/domain/image_props.dart';
import 'package:themby/src/features/emby/domain/media.dart';
import 'package:themby/src/features/emby/presentation/widget/loading_card.dart';

class MediaCard extends ConsumerWidget{
  final Media media;

  const MediaCard({super.key, required this.media});


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final site = ref.watch(embyStateServiceProvider.select((value) => value.site));

    final double height = MediaQuery.of(context).size.width < 650 ? 180.0 : 270;
    final double width = MediaQuery.of(context).size.width < 650 ? 108.0 : 162;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: (){
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: media.imageTags.primary != null ? CachedNetworkImage(
                  height: height,
                  width: width,
                  imageUrl: getImageUrl(
                      site!,
                      media.id,
                      ImageProps(
                        tag: media.imageTags.primary,
                      )
                  ),
                  placeholder: (_,__) => const LoadingCard(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                  fit: BoxFit.fitHeight,
                )
                : Container(
                  color: Colors.black12,
                  height: height,
                  width: width,
                  child: const Icon(
                    Icons.movie_creation_outlined,
                    size: 50,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              SizedBox(
                width: width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      media.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      media.productionYear.toString(),
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
      )
    );
  }
}