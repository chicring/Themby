import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';
import 'package:themby/src/common/widget/header_text.dart';
import 'package:themby/src/common/widget/shimmer.dart';
import 'package:themby/src/features/emby/application/emby_state_service.dart';
import 'package:themby/src/features/emby/data/image_repository.dart';
import 'package:themby/src/features/emby/data/view_repository.dart';
import 'package:themby/src/features/emby/domain/image_props.dart';
import 'package:themby/src/features/emby/presentation/emby_view/emby_resume_media.dart';
import 'package:themby/src/features/emby/presentation/emby_view/emby_view_shimmer.dart';
import 'package:themby/src/features/emby/presentation/widget/list_cards_h.dart';

class EmbyView extends ConsumerWidget {
  const EmbyView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final site = ref.watch(embyStateServiceProvider.select((value) => value.site));
    final view = ref.watch(getViewsProvider);

    return view.when(
      loading: () => const EmbyViewShimmer(),
      error: (error, stack) => const EmbyViewShimmer(),
      data: (data) {
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(width: 12),

              const EmbyResumeMedia(),

              const HeaderText(text: '媒体库'),
              _libraryView(context, ref, data, site!),

              ...data.items.map((item){
                final media = ref.watch(getLastMediaProvider(item.id));
                return media.when(
                  loading: () => ShimmerList(height: MediaQuery.sizeOf(context).height * 0.18, width: MediaQuery.sizeOf(context).height * 0.117),
                  error: (error, stack) => ShimmerList(height: MediaQuery.sizeOf(context).height * 0.18, width: MediaQuery.sizeOf(context).height * 0.117),
                  data: (value) => value.isEmpty || item.collectionType == 'music' || item.collectionType == 'livetv' ? const SizedBox() :
                  ListCardsH(
                    name: item.name,
                    parentId: item.id,
                    medias: value,
                  )
                );

              })
            ],
          ),
        );
      },
    );
  }
}


Widget _libraryView(BuildContext context, WidgetRef ref, data, site){

  final double height = MediaQuery.of(context).size.width < 650 ? 110 : 165;
  final double width = MediaQuery.of(context).size.width < 650 ? 210 : 315;

  return SizedBox(
    height: height + 50,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: data.items.length,
      itemBuilder: (context, index) {
        final item = data.items[index];
        return Padding(
          padding: const EdgeInsets.all(4.0),
          child: InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: (){
              GoRouter.of(context).push(Uri(path: '/library/${item.id}', queryParameters: {'title': item.name}).toString());

              SmartDialog.showToast(item.name);
            },
            child: Column(
              children: [
                Container(
                  height: height,
                  width: width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: item.imageTags.primary != null ?
                    CachedNetworkImage(
                      imageUrl: getImageUrl(site!, item.id, ImageProps(
                        quality: 90,
                        tag: item.imageTags.primary,
                      )),
                      fit: BoxFit.cover,
                      placeholder: (_,__) => Shimmer.fromColors(
                        baseColor: Colors.black26,
                        highlightColor: Colors.black12,
                        child: Container(
                          color: Colors.black,
                          height: height,
                          width: width,
                        ),
                      ),
                    )
                    : Container(
                      color: Colors.grey[500],
                      height: height,
                      width: width,
                      child: const Center(
                        child: Icon(Icons.movie_creation_rounded,size: 50),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                SizedBox(
                  width: MediaQuery.of(context).size.height * 0.2,
                  child: Text(
                    item.name,
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
          ),
        );
      },
    ),
  );
}

