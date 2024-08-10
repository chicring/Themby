

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shimmer/shimmer.dart';
import 'package:themby/src/common/widget/dynamic_height_grid_view.dart';
import 'package:themby/src/common/widget/header_text.dart';
import 'package:themby/src/common/widget/network_img_layer.dart';
import 'package:themby/src/extensions/constrains.dart';
import 'package:themby/src/features/emby/data/view_repository.dart';
import 'package:themby/src/features/emby/domain/emby/item.dart';

class LibraryRecentView extends ConsumerWidget{
  const LibraryRecentView({super.key, required this.parentId, required this.filter});

  final String parentId;
  final String filter;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final resumes = ref.watch(getResumeMediaProvider(parentId: parentId));

    final mediaQuery = MediaQuery.of(context);

    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 12,bottom: 12),
      child: DynamicHeightGridView(
        crossAxisCount: mediaQuery.smAndDown ? 1 : 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        itemCount: resumes.valueOrNull?.length ?? 3,
        builder: (BuildContext context, int index) {
          return  resumes.when(
            data: (response) {
              final data = response[index];
              return LayoutBuilder(builder: (context, boxConstraints){
                final height = boxConstraints.maxWidth * 9 / 16;
                return RecentCard(
                  data: data,
                  width: boxConstraints.maxWidth,
                  height: height,
                );
              },
              );
            },
            loading: () => LayoutBuilder(builder: (context, boxConstraints){
              return SkeletonRecentCard(
                width: boxConstraints.maxWidth,
                height: boxConstraints.maxWidth * 9 / 16,
              );
            }),
            error: (Object error, StackTrace stackTrace) => const SizedBox(),
          );
        },
      ),
    );


  }

  Widget _recentList(List data, MediaQueryData mediaQuery) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 12,bottom: 12),
      child: DynamicHeightGridView(
        crossAxisCount: mediaQuery.smAndDown ? 1 : 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        itemCount: data.length,
        builder: (BuildContext context, int index) {
          return LayoutBuilder(builder: (context, boxConstraints){
            final height = boxConstraints.maxWidth * 9 / 16;
            return RecentCard(
              data: data[index],
              width: boxConstraints.maxWidth,
              height: height,
            );
          },
          );
        },
      ),
    );
  }


}

class RecentCard extends StatelessWidget {
  const RecentCard({super.key, required this.data, required this.width, required this.height});

  final Item data;

  final double width;

  final double height;

  @override
  Widget build(BuildContext context) {

    String imageUrl = "";

    if(data.type == "Episode") {
      imageUrl = (data.primaryImageAspectRatio ?? 0 ) >= 1
          ? data.imagesCustom!.primary
          : data.imagesCustom!.backdrop;
    }else{
      imageUrl = data.imagesCustom?.backdrop.isNotEmpty == true
          ? data.imagesCustom!.backdrop
          : data.imagesCustom!.primary;
    }

    return Card(
      clipBehavior: Clip.antiAlias,
      margin: EdgeInsets.zero,
      elevation: 0,
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: width,
            height: height,
            child: NetworkImgLayer(
              imageUrl: imageUrl,
              width: width,
              height: height,
            ),
          ),
          Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.3),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          IconButton(
            icon: const Icon(
              Icons.play_circle_fill,
              color: Colors.white,
              size: 48,
            ),
            onPressed: () {
              // GoRouter.of(context).push('/details/${data.id}');
            },
          ),
          Positioned(
            bottom: 10,
            right: 12,
            child: NetworkImgLayer(
              imageUrl: data.imagesCustom?.primary,
              width: width * 0.2,
              height: width * 0.2 / 0.68,
            ),
          ),
          Positioned(
            bottom: 10,
            left: 12,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CachedNetworkImage(
                  height: height * 0.5,
                  width: width * 0.5,
                  alignment: Alignment.bottomLeft,
                  imageUrl: data.imagesCustom!.logo,
                  errorWidget: (_,__,___) => Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      data.name!,
                      maxLines: 2,
                      style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                if(data.type == "Episode")
                  SizedBox(
                    width: 300,
                    child: Text(
                        'S${data.parentIndexNumber}E${data.indexNumber} - ${data.name}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(color: Colors.white,fontSize: 12)
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SkeletonRecentCard extends StatelessWidget {
  const SkeletonRecentCard({super.key, required this.width, required this.height});

  final double width;

  final double height;


  @override
  Widget build(BuildContext context) {

    Color inverseSurface = Theme.of(context).colorScheme.inverseSurface;
    Color onInverseSurface = Theme.of(context).colorScheme.onInverseSurface;

    return Shimmer.fromColors(
      baseColor: inverseSurface,
      highlightColor: onInverseSurface,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: inverseSurface,
        ),
      ),
    );
  }
}