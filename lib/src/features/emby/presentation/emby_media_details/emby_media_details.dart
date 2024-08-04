

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:themby/src/common/widget/keep_alive_wrapper.dart';
import 'package:themby/src/features/emby/data/view_repository.dart';
import 'package:themby/src/features/emby/presentation/emby_media_details/appbar/emby_detail_content.dart';
import 'package:themby/src/features/emby/presentation/emby_media_details/emby_detail_season.dart';

import 'emby_detail_external_links.dart';

import 'emby_detail_genres.dart';
import 'emby_detail_media_selection.dart';
import 'emby_detail_people.dart';
import 'emby_detail_streams.dart';
import 'emby_details_nextup.dart';
import 'emby_media_details_appbar.dart';
import 'emby_media_details_shimmer.dart';


import 'emby_media_similar.dart';
import 'widgets/play_button.dart';

class EmbyMediaDetails extends ConsumerStatefulWidget {
  final String id;
  const EmbyMediaDetails({super.key,required this.id});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _EmbyMediaDetailsState();
}

class _EmbyMediaDetailsState extends ConsumerState<EmbyMediaDetails>{

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

    final data = ref.watch(GetMediaProvider(widget.id));

    // ref.watch(getPlaybackInfoProvider(widget.id));

    return data.when(
      data: (mediaDetail) {
        return Scaffold(
            floatingActionButton: PlayButton(item: mediaDetail),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
            body: CustomScrollView(
              controller: _controller,
              slivers: [
                DetailAppBar(id: mediaDetail.id!, titleStreamC: titleStreamC),
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      const SizedBox(height: 12),
                      EmbyDetailContent(item: mediaDetail),

                      const SizedBox(height: 10),
                      EmbyDetailGenres(items: mediaDetail.genreItems!),

                      if(mediaDetail.mediaType == 'Video') ...{
                        const SizedBox(height: 10),
                        EmbyDetailMediaSelection(item: mediaDetail),
                      },

                      if(mediaDetail.type == 'Series') ...{
                        const SizedBox(height: 10),

                        EmbyDetailsNextUp(seriesId: mediaDetail.id!),

                        EmbyDetailSeason(id: mediaDetail.id!),
                      },


                      if(mediaDetail.people?.isNotEmpty == true)...{
                        const SizedBox(height: 10),
                        DetailPeople(people: mediaDetail.people!),
                      },

                      const SizedBox(height: 15),
                      EmbyDetailExternalLinks(externalUrls: mediaDetail.externalUrls!),

                      KeepAliveWrapper(
                        child: SimilarMedias(id: mediaDetail.id!)
                      ),

                      const SizedBox(height: 10),
                      if (mediaDetail.mediaType == 'Video')
                        EmbyDetailStreams(source: mediaDetail.mediaSources),

                      const SizedBox(height: 100),
                    ],
                  ),
                ),
              ],
            )
        );
      },
      loading: () => const EmbyMediaDetailsShimmer(),
      error: (error, stackTrace) => const Center(child: Text('Error:')),
    );
  }
}
