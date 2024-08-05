import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:themby/src/common/constants.dart';
import 'package:themby/src/common/widget/network_img_layer.dart';
import 'package:themby/src/features/emby/data/view_repository.dart';
import 'package:themby/src/features/emby/domain/emby/item.dart';
import 'package:themby/src/features/emby/presentation/widgets/episode_card.dart';
import 'package:themby/src/helper/screen_helper.dart';


class EmbySeasonDetails extends ConsumerStatefulWidget {
  const EmbySeasonDetails(this.id, {super.key});
  final String id;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _EmbySeasonDetails();
}

class _EmbySeasonDetails extends ConsumerState<EmbySeasonDetails> {

  late final ScrollController _controller = ScrollController();
  late StreamController<bool> titleStreamC;

  @override
  void initState() {
    super.initState();
    titleStreamC = StreamController<bool>();

    _controller.addListener(() {
      if (_controller.offset > 150) {
        titleStreamC.add(true);
      } else if (_controller.offset <= 150) {
        titleStreamC.add(false);
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    titleStreamC.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final episodes = ref.watch(getEpisodesProvider(widget.id,widget.id));

    final item = ref.watch(GetMediaProvider(widget.id));

    double cardWidth = ScreenHelper.getPortionAuto(xs: 5, sm: 4, md: 3);
    double cardHeight = cardWidth * 9 / 16;

    return Scaffold(
      body: episodes.when(
        data: (data) => CustomScrollView(
          controller: _controller,
          slivers: [
            item.when(
              data: (value) => SeasonAppBar(
                item: value,
                titleStreamC: titleStreamC,
              ),
              loading: () => const SliverToBoxAdapter(child: SizedBox()),
              error: (error, stackTrace) => const SliverToBoxAdapter(child: SizedBox()),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                return EpisodeCard(
                  item: data[index],
                  width: cardWidth,
                  height: cardHeight,
                );
              },
                childCount: data.length,
              ),
            ),
          ],
        ),
        loading: () => _buildLoading(),
        error: (error, stackTrace) => const SizedBox(),
      ),
    );
  }

  Widget _buildLoading() => const Center(child: CircularProgressIndicator());

}


class SeasonAppBar extends StatelessWidget {
  final Item item;
  final StreamController<bool> titleStreamC;
  const SeasonAppBar({super.key, required this.item,required this.titleStreamC});


  @override
  Widget build(BuildContext context) {
    final double heightBar = MediaQuery.sizeOf(context).width * 0.65;

    final String imageUrl = (item.imagesCustom?.backdrop.isNotEmpty ?? false)
        ? item.imagesCustom?.backdrop ?? ''
        : item.imagesCustom?.primary ?? '';

    return SliverAppBar(
      expandedHeight: heightBar - MediaQuery.of(context).padding.top,
      pinned: true,
      centerTitle: true,
      iconTheme: const IconThemeData(color: Colors.grey),
      title: StreamBuilder(
        stream: titleStreamC.stream,
        initialData: false,
        builder: (context, snapshot) {
          return snapshot.data == true ? Text('${item.seriesName} ${item.name}', style: StyleString.titleStyle) : const SizedBox();
        },
      ),
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.pin,
        stretchModes: const [StretchMode.fadeTitle],
        background: Stack(
          children: [
            SizedBox(
              child: NetworkImgLayer(
                imageUrl: imageUrl,
                width: MediaQuery.sizeOf(context).width,
                height: MediaQuery.sizeOf(context).width * 0.65,
              ),
            ),
            Container(
              height: heightBar,
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
                  maxHeight: heightBar * 0.33,
                  // maxWidth: width * 0.5,
                  minHeight: heightBar * 0.2,
                  // minWidth: width * 0.3,
                ),
                child: CachedNetworkImage(
                  imageUrl: item.imagesCustom!.logo,
                  errorWidget: (_,__,___) => Text('${item.seriesName} ${item.name}', style: const TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

