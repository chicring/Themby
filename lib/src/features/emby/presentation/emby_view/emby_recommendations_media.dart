import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:go_router/go_router.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:shimmer/shimmer.dart';
import 'package:themby/src/common/widget/network_img_layer.dart';
import 'package:themby/src/features/emby/application/emby_common_service.dart';
import 'package:themby/src/features/emby/application/emby_state_service.dart';
import 'package:themby/src/features/emby/data/image_repository.dart';
import 'package:themby/src/features/emby/data/view_repository.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:themby/src/features/emby/domain/image_props.dart';

class EmbyRecommendationsMedia extends ConsumerStatefulWidget{
  const EmbyRecommendationsMedia({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SmallSlider();
}


class _SmallSlider extends ConsumerState<EmbyRecommendationsMedia> {
  Color? dominantColor;

  @override
  void initState() {
    super.initState();
  }

  Future<void> getDominantColor(String imageUrl) async {
    final PaletteGenerator paletteGenerator = await PaletteGenerator.fromImageProvider(
      NetworkImage(imageUrl),
    );
    dominantColor = paletteGenerator.dominantColor?.color ?? Colors.white;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final medias = ref.watch(getSuggestionsProvider);

    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).width * 100 / 166;



    return medias.when(
      loading: () => const SizedBox(),
      error: (error, stack) => const SizedBox(),
      data: (data) {
        return CarouselSlider(
          options: CarouselOptions(
            height: height + 90,
            autoPlay: true,
            viewportFraction: 1,
          ),
          items: data.map((media) {
            return Stack(
              children: [
                ShaderMask(
                  shaderCallback: (Rect bounds){
                    return LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.center,
                        stops: const [0, 1],
                        colors: [
                          const Color.fromRGBO(0, 0, 0, 0),
                          Theme.of(context).scaffoldBackgroundColor
                        ]
                    ).createShader(bounds);
                  },
                  blendMode: BlendMode.dstIn,
                  child: Column(
                    children: [
                      Container(
                        height: 90,
                        color: dominantColor,
                      ),
                      NetworkImgLayer(
                        imageUrl: media.imagesCustom?.backdrop ?? "",
                        width: width,
                        height: height,
                      )
                    ],
                  ),
                ),
                Positioned(
                    left: 18,
                    bottom: 10,
                    child: ElevatedButton.icon(
                      onPressed: () async {
                        // EasyDebounce.debounce(
                        //     'my-debouncer',
                        //     const Duration(milliseconds: 500),
                        //         () => GoRouter.of(context).push('/player', extra: getPlayInfoByMedia(media)),
                        // );
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
          }).toList(),
        );
      },
    );
  }
}

// class LargeSlider extends ConsumerWidget {
//   const LargeSlider({super.key});
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final medias = ref.watch(getSuggestionsProvider);
//     final site = ref.watch(embyStateServiceProvider.select((value) => value.site));
//     final Size screenSize = MediaQuery.sizeOf(context);
//
//     return medias.when(
//       loading: () => Shimmer.fromColors(
//         baseColor: Colors.black26,
//         highlightColor: Colors.black12,
//         child: Container(
//           color: Colors.black,
//           height: screenSize.height * 0.7 + 5,
//           width: screenSize.width,
//         ),
//       ),
//       error: (error, stack) => Center(child: Text(error.toString() + stack.toString())),
//       data: (data) {
//         return CarouselSlider(
//           options: CarouselOptions(
//             height: screenSize.height * 0.7 + 5,
//             autoPlay: true,
//             viewportFraction: 1,
//           ),
//           items: data.map((media) {
//             final imageTag = media.backdropImageTags.first;
//             final logoTag = media.imageTags.logo;
//             if(imageTag.isEmpty || logoTag == null){
//               return const SizedBox();
//             }else{
//               return Stack(
//                 alignment: Alignment.center,
//                 children: [
//                   SizedBox(
//                     child: Column(
//                       children: [
//                         Container(
//                           constraints: BoxConstraints.expand(height: screenSize.height * 0.7),
//                           child: CachedNetworkImage(
//                             imageUrl: getImageUrl(
//                                 site!,
//                                 media.id,
//                                 ImageProps(
//                                   quality: 90,
//                                   type: ImageType.backdrop,
//                                   tag: imageTag,
//                                 )
//                             ),
//                             height: screenSize.height * 0.6,
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                         const SizedBox(height: 5),
//                       ],
//                     ),
//                   ),
//                   Container(
//                     height: screenSize.height * 0.7,
//                     decoration: const BoxDecoration(
//                       gradient: LinearGradient(
//                         colors: [Colors.transparent, Colors.black26],
//                         begin: Alignment.center,
//                         end: Alignment.topCenter,
//                       ),
//                     ),
//                   ),
//                   Container(
//                     height: screenSize.height * 0.7,
//                     decoration: BoxDecoration(
//                       gradient: LinearGradient(
//                         colors: [Colors.transparent, Theme.of(context).scaffoldBackgroundColor],
//                         begin: Alignment.topCenter,
//                         end: Alignment.bottomCenter,
//                         stops: const [0.8, 1.0],
//                       ),
//                     ),
//                   ),
//                   Positioned(
//                     bottom: 50,
//                     right: 50,
//                     child: CachedNetworkImage(
//                       imageUrl: getImageUrl(
//                           site,
//                           media.id,
//                           ImageProps(
//                             quality: 90,
//                             type: ImageType.logo,
//                             tag: logoTag,
//                           )
//                       ),
//                       height: 100,
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                   Positioned(
//                     bottom: 50,
//                     left: 50,
//                     child: MaterialButton(
//                       onPressed: (){},
//                       color: Colors.white,
//                       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       child: const Text(
//                         'MORE',
//                         style: TextStyle(
//                           fontSize: 30,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   ),
//                   // Positioned(
//                   //   left: 100,
//                   //   bottom: 225,
//                   //   child: Column(
//                   //     crossAxisAlignment: CrossAxisAlignment.start,
//                   //     children: [
//                   //       Text(
//                   //         media.overview,
//                   //         maxLines: 4,
//                   //         style: const TextStyle(
//                   //           fontSize: 30,
//                   //           fontWeight: FontWeight.bold,
//                   //         ),
//                   //       ),
//                   //       Text(
//                   //         media.productionYear.toString(),
//                   //         style: const TextStyle(
//                   //           fontSize: 20,
//                   //         ),
//                   //       ),
//                   //     ],
//                   //   ),
//                   // ),
//                 ],
//               );
//             }
//           }).toList(),
//         );
//       },
//     );
//   }
// }