import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shimmer/shimmer.dart';
import 'package:themby/src/common/widget/dynamic_height_grid_view.dart';
import 'package:themby/src/common/widget/header_text.dart';
import 'package:themby/src/common/widget/network_img_layer.dart';
import 'package:themby/src/extensions/constrains.dart';
import 'package:themby/src/features/emby/data/view_repository.dart';
import 'package:themby/src/features/emby/domain/emby/item.dart';
import 'package:themby/src/features/emby/presentation/emby_search/widgets/search_text.dart';

class LibraryGenreView extends ConsumerWidget{
  const LibraryGenreView({super.key, required this.parentId, required this.filter});

  final String parentId;
  final String filter;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(getGenresProvider(parentId));
    final mediaQuery = MediaQuery.of(context);

    return CustomScrollView(
      physics: const NeverScrollableScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 3),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
            ),
            child: SizedBox(
              width: 100,
              child: Text('${data.valueOrNull?.totalRecordCount ?? 0} 项'),
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.only(top: 12, left: 12, right: 12),
          sliver:  SliverDynamicHeightGridView(
            crossAxisCount: mediaQuery.smAndDown ? 3 : 6,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            itemCount: data.valueOrNull?.totalRecordCount ?? 6,
            builder: (BuildContext context, int index) {
              return data.when(
                data: (data) {
                  final item = data.items[index];
                  return LayoutBuilder(
                    builder: (context, constraints) {
                      final width = constraints.maxWidth;
                      final height = constraints.maxWidth;
                      return GenreCard(
                        item: item,
                        width: width,
                        height: height,
                      );
                    },
                  );
                },
                loading: () => LayoutBuilder(
                  builder: (context, constraints) {
                    return SkeletonRecentCard(
                      width: constraints.maxWidth,
                      height: constraints.maxWidth,
                    );
                  },
                ),
                error: (error, stackTrace) => const SizedBox(),
              );
            },
          ),
        ),
      ],
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
      child: Column(
        children: [
          Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: inverseSurface,
            ),
          ),
          const SizedBox(height: 5),
          Container(
            width: width * 0.4,
            height: 14,
            decoration: BoxDecoration(
              color: inverseSurface,
            ),
          ),
        ],
      ),
    );
  }
}

class GenreCard extends StatelessWidget {
  const GenreCard({super.key, required this.item, required this.width, required this.height});

  final Item item;

  final double width;

  final double height;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      semanticContainer: false,
      clipBehavior: Clip.hardEdge,
      margin: EdgeInsets.zero,
      color: Colors.transparent,
      child: InkWell(
        onTap: (){},
        child: Column(
          children: [
            NetworkImgLayer(
              imageUrl: item.imagesCustom!.primary,
              width: width,
              height: height,
            ),
            const SizedBox(height: 5),
            Text(
              item.name ?? '',
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}