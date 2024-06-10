import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:shimmer/shimmer.dart';
import 'package:themby/src/features/emby/application/emby_state_service.dart';
import 'package:themby/src/features/emby/data/image_repository.dart';
import 'package:themby/src/features/emby/data/view_repository.dart';
import 'package:themby/src/features/emby/domain/image_props.dart';
import 'package:themby/src/features/emby/presentation/emby_view/emby_resume_media.dart';
import 'package:themby/src/features/emby/presentation/widget/horizontal_list_cards.dart';

class EmbyView extends ConsumerWidget {
  const EmbyView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final site = ref.watch(embyStateServiceProvider.select((value) => value.site));
    final view = ref.watch(getViewsProvider);

    return view.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) =>  Center(child: Text(error.toString() + stack.toString())),
      data: (data) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(width: 12),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.12 + 30,
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                children: data.items
                    .map(
                      (item) => Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: (){
                          SmartDialog.showToast(item.name);
                        },
                        child: Column(
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height * 0.12,
                              width: MediaQuery.of(context).size.height * 0.2,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: CachedNetworkImage(
                                  imageUrl: getImageUrl(site!, item.id, ImageProps(
                                    quality: 90,
                                    tag: item.imageTags.keys.first,
                                  )),
                                  fit: BoxFit.cover,
                                  placeholder: (_,__) => Shimmer.fromColors(
                                    baseColor: Colors.black26,
                                    highlightColor: Colors.black12,
                                    child: Container(
                                      color: Colors.black,
                                      height: MediaQuery.of(context).size.height * 0.12,
                                      width: MediaQuery.of(context).size.height * 0.2,
                                    ),
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
                      )
                  ),
                )
                    .toList(),
              ),
            ),

            const EmbyResumeMedia(),

            ...data.items.map((item){
              final media = ref.watch(getLastMediaProvider(item.id));

              return media.when(
                loading: () => const CircularProgressIndicator(),
                error: (error, stack) => const Text('Error'),
                data: (value) => value.isEmpty ? const SizedBox() :
                   HorizontalListViewMedias(
                     name: item.name,
                     medias: value,
                     parentId: item.id,
                  )
                ,
              );

            })
          ],
        );
      },
    );
  }
}
