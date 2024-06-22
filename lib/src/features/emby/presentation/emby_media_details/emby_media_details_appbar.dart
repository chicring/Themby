
import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:themby/src/common/constants.dart';
import 'package:themby/src/common/domiani/site.dart';
import 'package:themby/src/common/widget/network_img_layer.dart';
import 'package:themby/src/features/emby/data/image_repository.dart';
import 'package:themby/src/features/emby/domain/image_props.dart';
import 'package:themby/src/features/emby/domain/media_detail.dart';


class DetailAppBar extends StatelessWidget {
  final Site site;
  final MediaDetail mediaDetail;
  final StreamController<bool> titleStreamC;
  const DetailAppBar({super.key, required this.site, required this.mediaDetail, required this.titleStreamC});

  @override
  Widget build(BuildContext context) {
    final double heightBar = MediaQuery.sizeOf(context).width * 0.65;

    return SliverAppBar(
      expandedHeight: heightBar - MediaQuery.of(context).padding.top,
      pinned: true,
      centerTitle: true,
      iconTheme: const IconThemeData(color: Colors.grey),
      title: StreamBuilder(
        stream: titleStreamC.stream,
        initialData: false,
        builder: (context, snapshot) {
          return snapshot.data == true ? Text(mediaDetail.name, style: StyleString.titleStyle) : const SizedBox();
        },
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.favorite),
          onPressed: (){},
        ),
        IconButton(
          icon: const Icon(Icons.share),
          onPressed: (){},
        ),
      ],
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.pin,
        stretchModes: const [StretchMode.fadeTitle],
        background: DetailBackground(mediaDetail: mediaDetail,site: site),
      ),
    );
  }
}

class DetailBackground extends StatelessWidget {
  final Site site;
  final MediaDetail mediaDetail;
  const DetailBackground({super.key, required this.mediaDetail, required this.site});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.sizeOf(context).width * 0.65;
    final double width = MediaQuery.sizeOf(context).width;

    return Stack(
      children: [
        SizedBox(
          child: NetworkImgLayer(
            imageUrl: getImageUrl(
                site,
                mediaDetail.id,
                ImageProps(
                  tag: mediaDetail.imageTags.backdrop,
                  type: ImageType.backdrop,
                )
            ),
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).width * 0.65,
          ),
        ),
        Container(
          height: height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.transparent, Theme.of(context).scaffoldBackgroundColor],
              begin: Alignment.center,
              end: Alignment.bottomCenter,
              stops: const [0.0, 0.9],
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 20,
          child: Container(
            constraints: BoxConstraints(
              maxHeight: height * 0.33,
              maxWidth: width * 0.5,
              minHeight: height * 0.2,
              minWidth: width * 0.3,
            ),
            child: CachedNetworkImage(
              imageUrl: getImageUrl(
                  site,
                  mediaDetail.id,
                  ImageProps(
                    tag: mediaDetail.imageTags.logo,
                    type: ImageType.logo,
                  )
              ),
              errorWidget: (_,__,___) => Text(mediaDetail.name, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
          ),
        ),
      ],
    );
  }
}