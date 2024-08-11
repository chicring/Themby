
import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:themby/src/common/constants.dart';
import 'package:themby/src/common/widget/network_img_layer.dart';
import 'package:themby/src/features/emby/data/view_repository.dart';
import 'package:themby/src/features/emby/domain/emby/item.dart';
import 'package:themby/src/features/emby/presentation/widgets/like_button.dart';
import 'package:themby/src/features/emby/presentation/widgets/played_button.dart';


class DetailAppBar extends ConsumerWidget {
  final String id;
  final StreamController<bool> titleStreamC;
  const DetailAppBar({super.key, required this.id, required this.titleStreamC});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final double heightBar = MediaQuery.sizeOf(context).height * 0.4;

    final data = ref.watch(GetMediaProvider(id));

    return data.when(
        data: (data) => SliverAppBar(
          expandedHeight: heightBar - MediaQuery.of(context).padding.top,
          pinned: true,
          centerTitle: true,
          iconTheme: const IconThemeData(color: Colors.white),
          title: StreamBuilder(
            stream: titleStreamC.stream,
            initialData: false,
            builder: (context, snapshot) {
              return snapshot.data == true ? Text(data.name ?? '', style: StyleString.titleStyle) : const SizedBox();
            },
          ),
          actions: [
            PlayedButton(
              id: data.id!,
              played: data.userData?.played ?? false,
            ),
            LikeButton(
              id: data.id!,
              liked: data.userData?.isFavorite ?? false,
            )
          ],
          flexibleSpace: FlexibleSpaceBar(
            collapseMode: CollapseMode.pin,
            stretchModes: const [StretchMode.fadeTitle],
            background: DetailBackground(item: data),
          ),
        ),
        error: (error, _) => const SizedBox(),
        loading: () => const SizedBox()
    );
  }
}

class DetailBackground extends StatelessWidget {
  final Item item;
  const DetailBackground({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.sizeOf(context).height * 0.4;
    final double width = MediaQuery.sizeOf(context).width;

    final String imageUrl = (item.imagesCustom?.backdrop.isNotEmpty ?? false)
        ? item.imagesCustom?.backdrop ?? ''
        : item.imagesCustom?.primary ?? '';

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
          child: NetworkImgLayer(
            imageUrl: imageUrl,
            width: width,
            height: height,
            type: 'bg',
          ),
        ),
        Positioned(
          bottom: 0,
          left: 12,
          child: CachedNetworkImage(
            height: height * 0.5,
            width: width * 0.7,
            alignment: Alignment.bottomLeft,
            imageUrl: item.imagesCustom!.logo,
            httpHeaders: const {
              'user-agent': "Themby/1.0.3",
            },
            errorWidget: (_,__,___) => Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                item.name!,
                maxLines: 2,
                style: const TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ),
      ],
    );
  }
}