import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:themby/src/common/constants.dart';
import 'package:themby/src/helper/extension.dart';


class NetworkImgLayer extends StatelessWidget {
  const NetworkImgLayer({
    super.key,
    this.imageUrl,
    required this.width,
    required this.height,
    this.type,
    this.fadeOutDuration,
    this.fadeInDuration,
    this.quality,
    this.origAspectRatio,
  });

  final String? imageUrl;
  final double width;
  final double height;
  final String? type;
  final Duration? fadeOutDuration;
  final Duration? fadeInDuration;
  final int? quality;
  final double? origAspectRatio;

  @override
  Widget build(BuildContext context) {

    int? memCacheWidth, memCacheHeight;
    double aspectRatio = (width / height).toDouble();

    void setMemCacheSizes() {
      if (aspectRatio > 1) {
        memCacheHeight = height.cacheSize(context);
      } else if (aspectRatio < 1) {
        memCacheWidth = width.cacheSize(context);
      } else {
        if (origAspectRatio != null && origAspectRatio! > 1) {
          memCacheWidth = width.cacheSize(context);
        } else if (origAspectRatio != null && origAspectRatio! < 1) {
          memCacheHeight = height.cacheSize(context);
        } else {
          memCacheWidth = width.cacheSize(context);
          memCacheHeight = height.cacheSize(context);
        }
      }
    }

    setMemCacheSizes();

    if (memCacheWidth == null && memCacheHeight == null) {
      memCacheWidth = width.toInt();
    }

    return imageUrl != '' && imageUrl != null
        ? ClipRRect(
      clipBehavior: Clip.antiAlias,
      borderRadius: BorderRadius.circular(
        type == 'avatar'
            ? 50
            : type == 'bg'
            ? 0
            : StyleString.imgRadius.x,
      ),
      child: CachedNetworkImage(
        httpHeaders: const {
          'user-agent': "Themby/1.0.4",
        },
        imageUrl: imageUrl!,
        width: width,
        height: height,
        memCacheWidth: memCacheWidth,
        memCacheHeight: memCacheHeight,
        fit: BoxFit.cover,
        fadeOutDuration:
        fadeOutDuration ?? const Duration(milliseconds: 100),
        fadeInDuration:
        fadeInDuration ?? const Duration(milliseconds: 100),
        filterQuality: FilterQuality.medium,
        errorWidget: (BuildContext context, String url, Object error) =>
            errorWidget(context),
        placeholder: (BuildContext context, String url) =>
            placeholder(context),
      ),
    )
        : errorWidget(context);
  }

  Widget placeholder(BuildContext context) {
    Color inverseSurface = Theme.of(context).colorScheme.inverseSurface;
    Color onInverseSurface = Theme.of(context).colorScheme.onInverseSurface;

    return Shimmer.fromColors(
      baseColor: inverseSurface,
      highlightColor: onInverseSurface,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(type == 'avatar'
              ? 50
              : type == 'emote'
              ? 0
              : StyleString.imgRadius.x),
          color: inverseSurface,
        ),
        height: height,
        width: width,
      ),
    );
  }

  Widget errorWidget(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(type == 'avatar'
              ? 50
              : type == 'bg'
              ? 0
              : StyleString.imgRadius.x),
          color: Theme.of(context).colorScheme.surfaceContainer.withOpacity(0.9),
        ),
        height: height,
        width: width,
        child: Center(
          child: Icon(
            type == 'people' ? Icons.person_outline_outlined : Icons.movie_creation_outlined,
            size: 50,
          ),
        )
    );
  }
}