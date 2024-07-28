import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';
import 'package:themby/src/features/emby/application/emby_common_service.dart';
import 'package:themby/src/features/emby/application/emby_state_service.dart';
import 'package:themby/src/features/emby/data/image_repository.dart';
import 'package:themby/src/features/emby/data/view_repository.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:themby/src/features/emby/domain/image_props.dart';

class EmbyRecommendationsMedia extends ConsumerWidget{
  const EmbyRecommendationsMedia({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MediaQuery.of(context).size.width < 800 ? const SmallSlider() : const LargeSlider();
  }
}


class SmallSlider extends ConsumerWidget {
  const SmallSlider({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final medias = ref.watch(getSuggestionsProvider);
    final site = ref.watch(embyStateServiceProvider.select((value) => value.site));

    return medias.when(
      loading: () => Shimmer.fromColors(
        baseColor: Colors.black26,
        highlightColor: Colors.black12,
        child: Container(
          color: Colors.black,
          height: 555.0,
          width: MediaQuery.sizeOf(context).width,
        ),
      ),
      error: (error, stack) => Shimmer.fromColors(
        baseColor: Colors.black26,
        highlightColor: Colors.black12,
        child: Container(
          color: Colors.black,
          height: 555.0,
          width: MediaQuery.sizeOf(context).width,
        ),
      ),
      data: (data) {
        return CarouselSlider(
          options: CarouselOptions(
            height: 555.0,
            autoPlay: true,
            viewportFraction: 1,
          ),
          items: data.map((media) {
            final imageTag = media.imageTags.primary;
            if(imageTag == null){
              return const SizedBox();
            }else{
              return Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                   child: Column(
                     children: [
                       Container(
                         constraints: const BoxConstraints.expand(height: 550),
                         child: CachedNetworkImage(
                           imageUrl: getImageUrl(
                               site!,
                               media.id,
                               ImageProps(
                                 quality: 90,
                                 type: ImageType.primary,
                                 tag: imageTag,
                               )
                           ),
                           height: 550,
                           fit: BoxFit.cover,
                         ),
                       ),
                       const SizedBox(height: 5),
                     ],
                   ),
                  ),
                  Container(
                    height: 550.0,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.transparent, Theme.of(context).scaffoldBackgroundColor],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter, // 指定渐变方向从上到下
                        stops: const [0.6, 1.0], // 0.5处开始转变，到1.0处完全是黑色
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 30,
                    child: ElevatedButton.icon(
                      onPressed: () async {
                        EasyDebounce.debounce(
                            'my-debouncer',
                            const Duration(milliseconds: 500),
                                () => GoRouter.of(context).push('/player', extra: getPlayInfoByMedia(media))
                        );
                      },
                      icon: const Icon(Icons.play_arrow_rounded, color: Colors.black, size: 28),
                      label: const Text('播放', style: TextStyle(color: Colors.black)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        elevation: 0,
                      ),
                    )
                  )
                ],
              );
            }
          }).toList(),
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
    final Size screenSize = MediaQuery.sizeOf(context);

    return medias.when(
      loading: () => Shimmer.fromColors(
        baseColor: Colors.black26,
        highlightColor: Colors.black12,
        child: Container(
          color: Colors.black,
          height: screenSize.height * 0.7 + 5,
          width: screenSize.width,
        ),
      ),
      error: (error, stack) => Center(child: Text(error.toString() + stack.toString())),
      data: (data) {
        return CarouselSlider(
          options: CarouselOptions(
            height: screenSize.height * 0.7 + 5,
            autoPlay: true,
            viewportFraction: 1,
          ),
          items: data.map((media) {
            final imageTag = media.backdropImageTags.first;
            final logoTag = media.imageTags.logo;
            if(imageTag.isEmpty || logoTag == null){
              return const SizedBox();
            }else{
              return Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    child: Column(
                      children: [
                        Container(
                          constraints: BoxConstraints.expand(height: screenSize.height * 0.7),
                          child: CachedNetworkImage(
                            imageUrl: getImageUrl(
                                site!,
                                media.id,
                                ImageProps(
                                  quality: 90,
                                  type: ImageType.backdrop,
                                  tag: imageTag,
                                )
                            ),
                            height: screenSize.height * 0.6,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 5),
                      ],
                    ),
                  ),
                  Container(
                    height: screenSize.height * 0.7,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.transparent, Colors.black26],
                        begin: Alignment.center,
                        end: Alignment.topCenter,
                      ),
                    ),
                  ),
                  Container(
                    height: screenSize.height * 0.7,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.transparent, Theme.of(context).scaffoldBackgroundColor],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: const [0.8, 1.0],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 50,
                    right: 50,
                    child: CachedNetworkImage(
                      imageUrl: getImageUrl(
                          site,
                          media.id,
                          ImageProps(
                            quality: 90,
                            type: ImageType.logo,
                            tag: logoTag,
                          )
                      ),
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    bottom: 50,
                    left: 50,
                    child: MaterialButton(
                      onPressed: (){},
                      color: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Text(
                        'MORE',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  // Positioned(
                  //   left: 100,
                  //   bottom: 225,
                  //   child: Column(
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: [
                  //       Text(
                  //         media.overview,
                  //         maxLines: 4,
                  //         style: const TextStyle(
                  //           fontSize: 30,
                  //           fontWeight: FontWeight.bold,
                  //         ),
                  //       ),
                  //       Text(
                  //         media.productionYear.toString(),
                  //         style: const TextStyle(
                  //           fontSize: 20,
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                ],
              );
            }
          }).toList(),
        );
      },
    );
  }
}