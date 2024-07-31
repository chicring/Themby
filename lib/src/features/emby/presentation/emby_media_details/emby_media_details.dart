

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:go_router/go_router.dart';
import 'package:themby/src/common/constants.dart';
import 'package:themby/src/common/data/emby_repository.dart';
import 'package:themby/src/common/domiani/site.dart';
import 'package:themby/src/common/widget/dropdown_custom.dart';
import 'package:themby/src/features/emby/application/emby_common_service.dart';
import 'package:themby/src/features/emby/data/view_repository.dart';
import 'package:themby/src/features/emby/domain/media_detail.dart';
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
            floatingActionButton: GestureDetector(
              onTap: () async{
                GoRouter.of(context).push('/player', extra: getPlayInfo(mediaDetail));
              },
              onLongPress: (){
                SmartDialog.showToast('别长按我，等待播放');
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: StyleString.safeSpace),
                decoration: BoxDecoration(
                  borderRadius: StyleString.lgRadius,
                  color: Theme.of(context).colorScheme.primary,
                ),
                width: MediaQuery.sizeOf(context).width,
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.play_arrow_rounded , color: Theme.of(context).colorScheme.onPrimary),
                    const SizedBox(width: 10),
                    Text('播放', style: StyleString.titleStyle.copyWith(color: Theme.of(context).colorScheme.onPrimary)),
                  ],
                ),
              ),
            ),
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
                      // const SizedBox(height: 10),
                      // _DetailContent(mediaDetail: mediaDetail,site: site),

                      // const SizedBox(height: 5),
                      // _DetailOverview(mediaDetail: mediaDetail, site: site),

                      const SizedBox(height: 10),
                      EmbyDetailGenres(items: mediaDetail.genreItems!),

                      const SizedBox(height: 10),
                      EmbyDetailMediaSelection(item: mediaDetail),

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

                      SimilarMedias(id: mediaDetail.id!),

                      const SizedBox(height: 10),
                      if (mediaDetail.mediaType == 'Video')
                        EmbyDetailStreams(mediaStreams: mediaDetail.mediaStreams),

                      const SizedBox(height: 100),
                    ],
                  ),
                ),
              ],
            )
        );
      },
      loading: () => const EmbyMediaDetailsShimmer(),
      error: (error, stackTrace) => Center(child: Text('Error: $error$stackTrace')),
    );
  }
}



class _DetailContent extends StatelessWidget {
  final Site site;
  final MediaDetail mediaDetail;
  const _DetailContent({required this.mediaDetail, required this.site});


  @override
  Widget build(BuildContext context) {

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: StyleString.safeSpace),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(Icons.star, color: Colors.yellow, size: 20),
                  Text(
                    mediaDetail.communityRating,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 10),
              Text(
                mediaDetail.productionYear.toString(),
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
              ),
              const SizedBox(width: 10),

              if(mediaDetail.mediaType == 'Video') ...{
                Text(
                  tickToTime(mediaDetail.runTimeTicks),
                  style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal
                  ),
                ),
                const SizedBox(width: 10),
              },

              Text(
                mediaDetail.officialRating,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
              ),
              const SizedBox(width: 10),

              if(mediaDetail.type == 'Series')
                Text(
                  '共 ${mediaDetail.childCount} 季',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  ),
                ),
            ],
          ),

          if(mediaDetail.mediaType == 'Video') ...{
            const SizedBox(height: 5),
            Row(
              children: [
                const Text('视频:', style: StyleString.subtitleStyle),
                const SizedBox(width: 10),
                DropdownMenuCustom(
                  data: getMediaStreams(mediaDetail.mediaSources[0].mediaStreams, 'Video'),
                  initialSelection: 0,
                  onSelected: (value) => SmartDialog.showToast(value.toString()),
                )
              ],
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                const Text('音频:', style: StyleString.subtitleStyle),
                const SizedBox(width: 10),
                DropdownMenuCustom(
                  data: getMediaStreams(mediaDetail.mediaSources[0].mediaStreams, 'Audio'),
                  initialSelection: 0,
                  onSelected: (value) => SmartDialog.showToast(value.toString()),
                )
              ],
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                const Text('字幕:', style: StyleString.subtitleStyle),
                const SizedBox(width: 10),
                DropdownMenuCustom(
                  data: getMediaStreams(mediaDetail.mediaSources[0].mediaStreams, 'Subtitle'),
                  initialSelection: 0,
                  onSelected: (value) => SmartDialog.showToast(value.toString()),
                )
              ],
            ),
          }
        ],
      ),
    );
  }
}



/// 媒体详细信息
class _MediaDetail extends StatelessWidget {
  final MediaDetail mediaDetail;
  const _MediaDetail({required this.mediaDetail});

  String _formatSize(int size) {
    const int KB = 1024;
    const int MB = KB * 1024;
    const int GB = MB * 1024;
    const int TB = GB * 1024;

    if (size >= TB) {
      return '${(size / TB).toStringAsFixed(2)} TB';
    } else if (size >= GB) {
      return '${(size / GB).toStringAsFixed(2)} GB';
    } else if (size >= MB) {
      return '${(size / MB).toStringAsFixed(2)} MB';
    } else if (size >= KB) {
      return '${(size / KB).toStringAsFixed(2)} KB';
    } else {
      return '$size B';
    }
  }

  @override
  Widget build(BuildContext context) {

    TextStyle textStyle = const TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
    );

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: StyleString.safeSpace),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text(
            '媒体信息',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                mediaDetail.mediaSources[0].container,
              ),
              const SizedBox(width: 10),
              Text(
                _formatSize(mediaDetail.mediaSources[0].size),
              )
            ],
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 280,
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: mediaDetail.mediaSources[0].mediaStreams.map((stream) {
                return Card(
                  elevation: 0,
                  child: Container(
                    margin: const EdgeInsets.all(5),
                    height: 280,
                    width: 210,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        if (stream.type == 'Video') ...{
                          const Row(
                            children: [
                              Icon(Icons.videocam),
                              Text('视频'),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Text('标题: ${stream.displayTitle}', style: textStyle),
                          Text('编码: ${stream.codec}', style: textStyle),
                          Text('配置: ${stream.profile}', style: textStyle),
                          Text('等级: ${stream.level}', style: textStyle),
                          Text('分辨率: ${stream.height} x ${stream.width}', style: textStyle),
                          Text('长宽比: ${stream.aspectRatio}', style: textStyle),
                          Text('交错: ${stream.isInterlaced}', style: textStyle),
                          Text('帧率: ${stream.averageFrameRate}', style: textStyle),
                          Text('位深度: ${stream.bitDepth}', style: textStyle),
                          Text('像素格式: ${stream.pixelFormat}', style: textStyle),
                        }
                        else if (stream.type == 'Audio')...{
                          const Row(
                            children: [
                              Icon(Icons.audiotrack_outlined),
                              Text('音频'),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Text('标题: ${stream.displayTitle}', style: textStyle),
                          Text('嵌入式标题: ${stream.title}', style: textStyle),
                          Text('语言: ${stream.language}', style: textStyle),
                          Text('编解码器: ${stream.codec}', style: textStyle),
                          Text('布局: ${stream.channelLayout}', style: textStyle),
                          Text('频道: ${stream.channels} ch', style: textStyle),
                          Text('采样率: ${stream.sampleRate}', style: textStyle),
                          Text('位深度: ${stream.bitDepth} bit', style: textStyle),
                          Text('默认: ${stream.isDefault}', style: textStyle),
                        }

                        else if (stream.type == 'Subtitle') ...{
                          const Row(
                            children: [
                              Icon(Icons.subtitles_outlined),
                              Text('字幕'),
                            ],
                          ),
                            const SizedBox(height: 10),
                          Text('标题: ${stream.displayTitle}', style: textStyle),
                          Text('嵌入式标题: ${stream.title}', style: textStyle),
                          Text('编解码器: ${stream.codec}', style: textStyle),
                          Text('默认: ${stream.isDefault}', style: textStyle),
                          Text('强制: ${stream.isForced}', style: textStyle),
                          Text('听力障碍: ${stream.isHearingImpaired}', style: textStyle),
                          Text('外部: ${stream.isExternal}', style: textStyle),
                        }
                      ],

                    ),
                  ),
                );
              }).toList(),
            ),
          )
        ],
      ),
    );
  }
}