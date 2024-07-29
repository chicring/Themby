import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:themby/src/common/constants.dart';
import 'package:themby/src/common/domiani/site.dart';
import 'package:themby/src/common/widget/network_img_layer.dart';
import 'package:themby/src/features/emby/application/emby_state_service.dart';
import 'package:themby/src/features/emby/data/view_repository.dart';
import 'package:themby/src/features/emby/domain/emby/item.dart';
import 'package:themby/src/features/emby/presentation/widgets/episode_card.dart';
import 'package:themby/src/helper/screen_helper.dart';

import 'emby_media_details_appbar.dart';

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
  Widget build(BuildContext context) {
    final Site? site = ref.watch(embyStateServiceProvider.select((value) => value.site));
    final episodes = ref.watch(getEpisodesProvider(widget.id,widget.id));

    double cardWidth = ScreenHelper.getPortionAuto(xs: 5, sm: 4, md: 3);
    double cardHeight = cardWidth * 9 / 16;

    return Scaffold(
      body: episodes.when(
        data: (data) => CustomScrollView(
          controller: _controller,
          slivers: [
            SeasonAppBar(
              episodes: data[0],
              site: site!,
              titleStreamC: titleStreamC,
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
  final Item episodes;
  final Site site;
  final StreamController<bool> titleStreamC;
  const SeasonAppBar({super.key, required this.episodes, required this.site, required this.titleStreamC});


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
          return snapshot.data == true ? Text('${episodes.seriesName} ${episodes.seasonName}', style: StyleString.titleStyle) : const SizedBox();
        },
      ),
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.pin,
        stretchModes: const [StretchMode.fadeTitle],
        background: Container(
          foregroundDecoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.center,
              end: Alignment.bottomCenter,
              colors: [
                Colors.transparent,
                Theme.of(context).scaffoldBackgroundColor,
              ],
            ),
          ),
          child: NetworkImgLayer(
            imageUrl: episodes.imagesCustom?.backdrop,
            width: MediaQuery.sizeOf(context).width,
            height: heightBar,
          ),
        ),
      ),
    );
  }
}

