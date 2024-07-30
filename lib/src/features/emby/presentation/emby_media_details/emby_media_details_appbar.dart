
import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:themby/src/common/constants.dart';
import 'package:themby/src/common/domiani/site.dart';
import 'package:themby/src/common/widget/network_img_layer.dart';
import 'package:themby/src/features/emby/data/favorite_repository.dart';
import 'package:themby/src/features/emby/data/image_repository.dart';
import 'package:themby/src/features/emby/data/view_repository.dart';
import 'package:themby/src/features/emby/domain/emby/item.dart';
import 'package:themby/src/features/emby/domain/image_props.dart';
import 'package:themby/src/features/emby/domain/media_detail.dart';


class DetailAppBar extends ConsumerWidget {
  final String id;
  final StreamController<bool> titleStreamC;
  const DetailAppBar({super.key, required this.id, required this.titleStreamC});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final double heightBar = MediaQuery.sizeOf(context).width * 0.65;

    final data = ref.watch(GetMediaProvider(id));

    return data.when(
        data: (data) => SliverAppBar(
          expandedHeight: heightBar - MediaQuery.of(context).padding.top,
          pinned: true,
          centerTitle: true,
          iconTheme: const IconThemeData(color: Colors.grey),
          title: StreamBuilder(
            stream: titleStreamC.stream,
            initialData: false,
            builder: (context, snapshot) {
              return snapshot.data == true ? Text(data.name ?? '', style: StyleString.titleStyle) : const SizedBox();
            },
          ),
          actions: [
            IconButton(
                icon: const Icon(
                  Icons.check_circle_outline_rounded,
                  size: 28,
                ),
                onPressed: () {
                  SmartDialog.showToast('在做');
                }
            ),
            IconButton(
              icon: (data.userData?.isFavorite ?? false)
                  ? const Icon(Icons.favorite_rounded, color: Color(0xFFc45a65),size: 28)
                  : const Icon(Icons.favorite_border_rounded, size: 28),
              onPressed: () async {
                // await ref.read(favoriteMediaProvider.notifier).toggleFavorite(mediaDetail);
                ref.read(toggleFavoriteProvider(data.id!, !(data.userData?.isFavorite ?? false)).future).then((userData) {
                  if(userData.isFavorite == true) {
                    SmartDialog.showToast('已添加到收藏');
                  }
                  ref.refresh(GetMediaProvider(data.id!));
                  ref.refresh(
                      getItemProvider(
                          itemQuery: (
                          page: 0,
                          parentId: '',
                          includeItemTypes: 'Movie',
                          sortBy: 'SortName',
                          sortOrder: 'Ascending',
                          filters: 'IsFavorite',
                          )
                      )
                  );
                  ref.refresh(
                      getItemProvider(
                          itemQuery: (
                          page: 0,
                          parentId: '',
                          includeItemTypes: 'Series',
                          sortBy: 'SortName',
                          sortOrder: 'Ascending',
                          filters: 'IsFavorite',
                          )
                      )
                  );
                });
              },
            ),
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
    final double height = MediaQuery.sizeOf(context).width * 0.65;
    final double width = MediaQuery.sizeOf(context).width;

    final String imageUrl = (item.imagesCustom?.backdrop.isNotEmpty ?? false)
        ? item.imagesCustom?.backdrop ?? ''
        : item.imagesCustom?.primary ?? '';

    return Stack(
      children: [
        SizedBox(
          child: NetworkImgLayer(
            imageUrl: imageUrl,
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
              imageUrl: item.imagesCustom!.logo,
              errorWidget: (_,__,___) => Text(item.name!, style: const TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
            ),
          ),
        ),
      ],
    );
  }
}