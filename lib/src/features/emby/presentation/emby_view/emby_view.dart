import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';
import 'package:themby/src/common/constants.dart';
import 'package:themby/src/common/widget/header_text.dart';
import 'package:themby/src/features/emby/application/emby_state_service.dart';
import 'package:themby/src/features/emby/data/image_repository.dart';
import 'package:themby/src/features/emby/data/view_repository.dart';
import 'package:themby/src/features/emby/domain/image_props.dart';
import 'package:themby/src/features/emby/domain/view.dart';
import 'package:themby/src/helper/screen_helper.dart';

class EmbyView extends ConsumerWidget {
  const EmbyView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final site = ref.watch(embyStateServiceProvider.select((value) => value.site));
    final view = ref.watch(getViewsProvider);

    return view.when(
      loading: () => const SizedBox(),
      error: (error, stack) => const SizedBox(),
      data: (data) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HeaderText(text: '媒体库'),
            const SizedBox(height: 5),
            SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(width: StyleString.safeSpace),
                    for(int i = 0; i < data.items.length; i++ ) ...[
                      _viewItem(context, ref, data.items[i], site),
                      const SizedBox(width: 12),
                    ]
                  ],
                )
            )
          ],
        );
      },
    );
  }
}


Widget _viewItem(BuildContext context, WidgetRef ref,ViewDetail view, site){

  double cardWidth = ScreenHelper.getPortionAuto(xs: 5, sm: 4, md: 3) * 1.1;
  double cardHeight = cardWidth * 9 / 16;

  return InkWell(
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    onTap: (){
      GoRouter.of(context).push(Uri(path: '/library/${view.id}', queryParameters: {'title': view.name}).toString());
    },
    onLongPress: (){

    },
    child: Column(
      children: [
        Container(
          height: cardHeight,
          width: cardWidth,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10)
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: view.imageTags.primary != null ?
            CachedNetworkImage(
              imageUrl: getImageUrl(site!, view.id, ImageProps(
                quality: 90,
                tag: view.imageTags.primary,
              )),
              fit: BoxFit.cover,
              placeholder: (_,__) => Shimmer.fromColors(
                baseColor: Colors.black26,
                highlightColor: Colors.black12,
                child: Container(
                  color: Colors.black,
                  height: cardHeight,
                  width: cardWidth,
                ),
              ),
            )
                : Container(
              color: Colors.grey[500],
              height: cardHeight,
              width: cardWidth,
              child: const Center(
                child: Icon(Icons.movie_creation_rounded,size: 50),
              ),
            ),
          ),
        ),
        const SizedBox(height: 4),
        SizedBox(
          width: cardWidth,
          child: Text(
            view.name,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 12,
              letterSpacing: 0.5,
            ),
          ),
        )
      ],
    ),
  );
}

