import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:themby/src/features/emby/application/emby_state_service.dart';
import 'package:themby/src/features/emby/data/image_repository.dart';
import 'package:themby/src/features/emby/data/view_repository.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:themby/src/features/emby/domain/image_props.dart';

class EmbyRecommendationsMedia extends ConsumerWidget{
  const EmbyRecommendationsMedia({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MediaQuery.of(context).size.width < 450 ? const SmallSlider() : const LargeSlider();
  }
}


class SmallSlider extends ConsumerWidget {
  const SmallSlider({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final medias = ref.watch(getSuggestionsProvider);
    final site = ref.watch(embyStateServiceProvider.select((value) => value.site));

    return medias.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => Center(child: Text(error.toString() + stack.toString())),
      data: (data) {
        return SizedBox(
          child: Column(
            children: [
              CarouselSlider(
                options: CarouselOptions(
                  autoPlay: true,
                  autoPlayCurve: Curves.easeOutCirc,
                  clipBehavior: Clip.antiAlias,
                  viewportFraction: 1,
                ),
                items: data.map((media) =>
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0, left: 8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Stack(
                        children: [
                          Positioned.fill(
                            child: CachedNetworkImage(
                              width: MediaQuery.of(context).size.width * 0.9,
                              imageUrl: getImageUrl(
                                  site!,
                                  media.id,
                                  ImageProps(
                                    quality: 90,
                                    type: ImageType.backdrop,
                                    tag: media.backdropImageTags.first,
                                  )
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            left: 20,
                            bottom: 20,
                            child: media.imageTags['Logo'] != null ? CachedNetworkImage(
                              height: 50,
                              imageUrl: getImageUrl(
                                  site,
                                  media.id,
                                  ImageProps(
                                    quality: 90,
                                    type: ImageType.logo,
                                    tag: media.imageTags['Logo']!,
                                  )
                              ),
                              fit: BoxFit.cover,
                            ) : Text(
                              media.name,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ).toList(),
              )
            ],
          ),
        );
      },
    );
  }
}

class LargeSlider extends ConsumerWidget {
  const LargeSlider({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final medias = ref.watch(getSuggestionsProvider);
    final site = ref.watch(embyStateServiceProvider.select((value) => value.site));

    return medias.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => Center(child: Text(error.toString() + stack.toString())),
      data: (data) {
        return SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              CarouselSlider(
                options: CarouselOptions(
                  height: MediaQuery.of(context).size.height,
                  autoPlay: true,
                ),
                items: data.map((media) =>
                    Stack(
                      children: [
                        Positioned.fill(
                          child: CachedNetworkImage(
                            width: MediaQuery.of(context).size.width,
                            imageUrl: getImageUrl(
                                site!,
                                media.id,
                                ImageProps(
                                  quality: 90,
                                  type: ImageType.backdrop,
                                  tag: media.backdropImageTags.first,
                                )
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          left: 40,
                          bottom: 40,
                          child: media.imageTags['Logo'] != null ? CachedNetworkImage(
                            height: 80,
                            imageUrl: getImageUrl(
                                site,
                                media.id,
                                ImageProps(
                                  quality: 90,
                                  type: ImageType.logo,
                                  tag: media.imageTags['Logo']!,
                                )
                            ),
                            fit: BoxFit.cover,
                          ) : Text(
                            media.name,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Positioned(
                          right: 40,
                          bottom: 50,
                          child: RawMaterialButton(
                            onPressed: () {

                            },
                            elevation: 2.0,
                            fillColor: Colors.white,
                            child: Text('MORE'),
                            padding: const EdgeInsets.all(15.0),
                            shape: const CircleBorder(

                            ),
                          ),
                        )
                      ],
                    )
                ).toList(),
              )
            ],
          ),
        );
      },
    );
  }
}