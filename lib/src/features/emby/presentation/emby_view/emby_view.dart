import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:themby/src/features/emby/application/emby_state_service.dart';
import 'package:themby/src/features/emby/data/image_repository.dart';
import 'package:themby/src/features/emby/data/view_repository.dart';
import 'package:themby/src/features/emby/domain/image_props.dart';

class EmbyView extends ConsumerWidget {
  const EmbyView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final site = ref.watch(embyStateServiceProvider.select((value) => value.site));
    final view = ref.watch(getViewsProvider);

    return view.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => const Center(child: Text('Error')),
      data: (data) {
        return CarouselSlider(
          options: CarouselOptions(
            height: MediaQuery.of(context).size.height * 0.1,
            aspectRatio: 5 / 3,
            initialPage: 0,
            scrollDirection: Axis.horizontal,
            viewportFraction: 0.4,
            enableInfiniteScroll: false,
          ),
          items: data.items.map((item) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 2.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: CachedNetworkImage(
                      height: MediaQuery.of(context).size.height * 0.1,
                      width: double.infinity,
                      imageUrl: getImageUrl(site!, item.id, ImageProps(
                        quality: 80,
                        tag: item.imageTags.keys.first,
                      )),
                      fit: BoxFit.cover,
                      placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                    ),
                  ),
                );
              },
            );
          }).toList(),
        );
      },
    );
  }
}