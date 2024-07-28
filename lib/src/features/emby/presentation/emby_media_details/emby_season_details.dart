

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:themby/src/common/constants.dart';
import 'package:themby/src/common/domiani/site.dart';
import 'package:themby/src/common/widget/network_img_layer.dart';
import 'package:themby/src/features/emby/application/emby_common_service.dart';
import 'package:themby/src/features/emby/application/emby_state_service.dart';
import 'package:themby/src/features/emby/data/image_repository.dart';
import 'package:themby/src/features/emby/data/view_repository.dart';
import 'package:themby/src/features/emby/domain/episode.dart';
import 'package:themby/src/features/emby/domain/image_props.dart';
import 'package:themby/src/features/emby/domain/media_detail.dart';
import 'package:themby/src/features/emby/domain/season.dart';

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
                  return _buildData(data[index], site);
                },
                childCount: data.length,
              ),
            ),
          ],
        ),
        loading: () => _buildLoading(),
        error: (error, stackTrace) => _buildError(error, stackTrace),
      ),
    );
  }

  Widget _buildLoading() => const Center(child: CircularProgressIndicator());

  Widget _buildError(Object error,StackTrace? stackTrace) {
    return Center(child: Text('Something went wrong: $error $stackTrace'));
  }

  Widget _buildData(Episode data, Site? site) {
    return SeasonCard(
      episodes: data,
      site: site!,
    );
  }
}


class SeasonAppBar extends StatelessWidget {
  final Episode episodes;
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
            imageUrl: getImageUrl(
                site,
                episodes.id,
                ImageProps(
                  type: ImageType.primary,
                  tag: episodes.imageTags.primary,
                )
            ),
            width: MediaQuery.sizeOf(context).width,
            height: heightBar,
          ),
        ),
      ),
    );
  }
}

class SeasonCard extends StatelessWidget {
  const SeasonCard({super.key, required this.episodes, required this.site});
  final Episode episodes;
  final Site site;

  @override
  Widget build(BuildContext context) {

    final double height = MediaQuery.sizeOf(context).height * 0.12;

    return Card(
      color: Colors.transparent,
      elevation: 0,
      margin: const EdgeInsets.all(StyleString.safeSpace),
      child: InkWell(
        onTap: () {
          GoRouter.of(context).push('/details/${episodes.id}');
        },
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    NetworkImgLayer(
                      imageUrl: getImageUrl(
                          site,
                          episodes.id,
                          ImageProps(
                            type: ImageType.primary,
                            tag: episodes.imageTags.primary,
                          )
                      ),
                      width: height * episodes.primaryImageAspectRatio,
                      height: height,
                    ),
                    if(episodes.userData.played ?? false)
                       Positioned(
                        top: 3,
                        right: 3,
                        child: Icon(
                          Icons.check_circle,
                          color: Theme.of(context).colorScheme.primaryContainer,
                        ),
                      ),
                  ],
                ),

                const SizedBox(width: 10),
                Flexible(
                  fit: FlexFit.tight,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${episodes.indexNumber}.  ${episodes.name}',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: StyleString.titleStyle,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        tickToTime(episodes.runTimeTicks),
                        style: StyleString.subtitleStyle.copyWith(color: Colors.grey),
                      )
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(height: 5),
            SizedBox(
              width: MediaQuery.of(context).size.width - 2 * StyleString.safeSpace,
              child: Text(
                  episodes.overview,
                  maxLines: 6,
                  overflow: TextOverflow.ellipsis,
                  style: StyleString.subtitleStyle.copyWith(color: Colors.grey),
                )
            ),
          ],
        ),
      ),
    );
  }
}