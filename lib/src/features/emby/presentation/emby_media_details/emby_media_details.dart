

import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:go_router/go_router.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:themby/src/common/constants.dart';
import 'package:themby/src/common/domiani/site.dart';
import 'package:themby/src/common/widget/dropdown_custom.dart';
import 'package:themby/src/common/widget/network_img_layer.dart';
import 'package:themby/src/features/emby/application/emby_state_service.dart';
import 'package:themby/src/features/emby/data/image_repository.dart';
import 'package:themby/src/features/emby/data/play_repository.dart';
import 'package:themby/src/features/emby/data/view_repository.dart';
import 'package:themby/src/features/emby/domain/episode.dart';
import 'package:themby/src/features/emby/domain/image_props.dart';
import 'package:themby/src/features/emby/domain/media_detail.dart';
import 'package:themby/src/features/emby/domain/people.dart';
import 'package:themby/src/features/emby/domain/season.dart';
import 'package:themby/src/features/emby/presentation/widget/media_card_v.dart';
import 'package:themby/src/features/emby/presentation/widget/season_card_v.dart';

import 'emby_media_details_appbar.dart';
import 'emby_media_details_shimmer.dart';

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
    final Site? site = ref.watch(embyStateServiceProvider.select((value) => value.site));

    final data = ref.watch(GetMediaProvider(widget.id));

    // ref.watch(getPlaybackInfoProvider(widget.id));

    return data.when(
      data: (mediaDetail) {
        return Scaffold(
            floatingActionButton: GestureDetector(
              onTap: () async{
                GoRouter.of(context).push('/player/${mediaDetail.type}/${mediaDetail.id}');
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
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.play_arrow_rounded),
                    SizedBox(width: 10),
                    Text('播放', style: TextStyle(fontSize: 16)),
                  ],
                ),
              ),
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
            body: CustomScrollView(
              controller: _controller,
              slivers: [
                DetailAppBar(site: site!, mediaDetail: mediaDetail, titleStreamC: titleStreamC),
                SliverList(
                  delegate: SliverChildListDelegate(
                    [

                      const SizedBox(height: 10),
                      _DetailContent(mediaDetail: mediaDetail,site: site),

                      const SizedBox(height: 10),
                      _DetailGenres(genres: mediaDetail.genres),

                      const SizedBox(height: 5),
                      _DetailOverview(mediaDetail: mediaDetail, site: site),

                      if(mediaDetail.type == 'Series') ...{
                        const SizedBox(height: 10),
                        _Seasons(mediaDetail: mediaDetail),
                      },

                      if(mediaDetail.people.isNotEmpty)...{
                        const SizedBox(height: 10),
                        _DetailPeople(people: mediaDetail.people, site: site),
                      },

                      if(mediaDetail.type != 'Episode') ...{
                        const SizedBox(height: 15),
                        _ExternalLinks(externalUrls: mediaDetail.externalUrls),

                        const SizedBox(height: 10),
                        _SimilarMedias(medias: mediaDetail),
                      },


                      const SizedBox(height: 10),
                      if (mediaDetail.mediaType == 'Video')
                        _MediaDetail(mediaDetail: mediaDetail),

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



class _DetailAppBar extends StatelessWidget {
  final Site site;
  final MediaDetail mediaDetail;
  final StreamController<bool> titleStreamC;
  const _DetailAppBar({required this.site, required this.mediaDetail, required this.titleStreamC});

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
          return snapshot.data == true ? Text(mediaDetail.name, style: StyleString.titleStyle) : const SizedBox();
        },
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.favorite),
          onPressed: (){},
        ),
        IconButton(
          icon: const Icon(Icons.share),
          onPressed: (){},
        ),
      ],
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.pin,
        stretchModes: const [StretchMode.fadeTitle],
        background: _DetailBackground(mediaDetail: mediaDetail,site: site),
      ),
    );
  }
}

class _DetailBackground extends StatelessWidget {
  final Site site;
  final MediaDetail mediaDetail;
  const _DetailBackground({super.key, required this.mediaDetail, required this.site});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.sizeOf(context).width * 0.65;
    final double width = MediaQuery.sizeOf(context).width;

    return Stack(
      children: [
        SizedBox(
          child: NetworkImgLayer(
            imageUrl: getImageUrl(
                site,
                mediaDetail.id,
                ImageProps(
                  tag: mediaDetail.imageTags.backdrop,
                  type: ImageType.backdrop,
                )
            ),
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).width * 0.65,
          ),
        ),
        Container(
          height: height,
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
              maxHeight: height * 0.33,
              maxWidth: width * 0.5,
              minHeight: height * 0.2,
              minWidth: width * 0.3,
            ),
            child: CachedNetworkImage(
              imageUrl: getImageUrl(
                  site,
                  mediaDetail.id,
                  ImageProps(
                    tag: mediaDetail.imageTags.logo,
                    type: ImageType.logo,
                  )
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _DetailContent extends StatelessWidget {
  final Site site;
  final MediaDetail mediaDetail;
  const _DetailContent({required this.mediaDetail, required this.site});

  String _convertRuntimeTicksToMinutes(int runtimeTicks) {
    int totalSeconds = (runtimeTicks / 10000000).round();
    int hours = totalSeconds ~/ 3600;
    int minutes = (totalSeconds % 3600) ~/ 60;
    return '${hours}h ${minutes}m';
  }

  Widget select(BuildContext context, Map<String,String> fruits){
    return ConstrainedBox(
      constraints: const BoxConstraints(minWidth: 180),
      child: ShadSelect<String>(
        placeholder: const Text('Select a fruit'),
        initialValue: fruits.keys.first,
        options: [
          ...fruits.entries
              .map((e) =>
              ShadOption(value: e.key, child: Text(e.value)))
        ],
        focusNode: FocusNode(
          canRequestFocus: false,
        ),
        selectedOptionBuilder: (context, value) =>
            Text(fruits[value]!),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final fruits = {
      'apple': 'Apple',
      'banana': 'Banana',
      'blueberry': 'Blueberry',
      'grapes': 'Grapes',
      'pineapple': 'Pineapple',
    };
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
                  _convertRuntimeTicksToMinutes(mediaDetail.runTimeTicks),
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
          const SizedBox(height: 5),
          Row(
            children: [
              const Text('视频:', style: StyleString.subtitleStyle),
              const SizedBox(width: 10),
              select(context, fruits)
            ],
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              Text('音频:', style: StyleString.subtitleStyle),
              const SizedBox(width: 10),
              select(context, fruits)
            ],
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              Text('字幕:', style: StyleString.subtitleStyle),
              const SizedBox(width: 10),
              select(context, fruits)
            ],
          ),
        ],
      ),
    );
  }
}

/// 类型
class _DetailGenres extends StatelessWidget {
  final List<String> genres;
  const _DetailGenres({required this.genres});


  Widget buildTag(String genre, Color color) {
    return Text(
      genre,
      style: const TextStyle(
        fontSize: 15,
        decoration: TextDecoration.underline,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).colorScheme.primary;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: StyleString.safeSpace),
      child: Wrap(
        spacing: 6,
        alignment: WrapAlignment.start,
        children: genres.map((genre) => buildTag(genre,color)).toList(),
      ),
    );
  }
}

/// 概述
class _DetailOverview extends StatelessWidget {
  final MediaDetail mediaDetail;
  final Site site;
  const _DetailOverview({required this.mediaDetail, required this.site});

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(StyleString.safeSpace),
                    child: NetworkImgLayer(
                      imageUrl: getImageUrl(
                          site,
                          mediaDetail.id,
                          ImageProps(
                            tag: mediaDetail.imageTags.primary,
                            type: ImageType.primary,
                          )
                      ),
                      width: 100,
                      height: 150,
                    ),
                  ),
                  Expanded( // Add this
                    child: Padding(
                      padding: const EdgeInsets.all(StyleString.safeSpace),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            mediaDetail.name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            mediaDetail.productionYear.toString(),
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),

              Container(
                padding: const EdgeInsets.all(StyleString.safeSpace),
                child: Text(
                  mediaDetail.overview,
                  style: TextStyle(
                    fontSize: 15,
                    color: Theme.of(context).colorScheme.outline,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: StyleString.safeSpace, vertical: StyleString.safeSpace),
      child: GestureDetector(
        onTap: () => _showBottomSheet(context),
        child: Text(
          mediaDetail.overview,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.start,
          style: const TextStyle(
            fontSize: 14,
            height: 1.5,
          ),
        ),
      ),
    );
  }
}

/// 演员
class _DetailPeople extends StatelessWidget {
  final Site site;
  final List<People> people;
  const _DetailPeople({required this.people, required this.site});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width * 0.25;

    final double height = width / 0.65;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: StyleString.safeSpace),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '演员',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: StyleString.safeSpace),
          SizedBox(
            height: height + 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: people.length,
              itemBuilder: (context,index) {
                return Container(
                  margin: const EdgeInsets.only(right: 10),
                  width: width,
                  child: Column(
                    children: [
                      NetworkImgLayer(
                        imageUrl: getImageUrl(
                            site,
                            people[index].id,
                            ImageProps(
                              tag: people[index].primaryImageTag,
                              type: ImageType.primary,
                            )
                        ),
                        width: width,
                        height: height,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        people[index].name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        people[index].role,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 11,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

/// 外部链接
class _ExternalLinks extends StatelessWidget {
  final List<ExternalUrl> externalUrls;
  const _ExternalLinks({required this.externalUrls});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: StyleString.safeSpace),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '外部链接',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 40,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: externalUrls.length,
              itemBuilder: (context,index) {
                return Container(
                  margin: const EdgeInsets.only(right: 10), // Add this line to add space to the right of each item
                  child: ActionChip(
                    onPressed: (){},
                    avatar: const Icon(Icons.link),
                    shape: RoundedRectangleBorder(
                      borderRadius: StyleString.mdRadius,
                    ),
                    label: Text(externalUrls[index].name),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

/// 季
class _Seasons extends ConsumerWidget {
  final MediaDetail mediaDetail;
  const _Seasons({required this.mediaDetail});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(getSeasonsProvider(mediaDetail.id));
    return data.when(
      data: (seasons) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(width: StyleString.safeSpace),
                Text(
                  '季',
                  style: StyleString.titleStyle,
                ),
              ],
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.18 + 30,
              child: seasons.isEmpty ?
              const Center(child: Text('暂无数据')) :
              ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: seasons.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: MediaQuery.sizeOf(context).height * 0.117,
                    height: MediaQuery.sizeOf(context).height * 0.18,
                    margin: const EdgeInsets.only(
                      left: StyleString.safeSpace,
                    ),
                    child: SeasonCardV(
                      season: seasons[index],
                    ),
                  );
                },
              ),
            )
          ],
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stackTrace) => Center(child: Text('Error: $error$stackTrace'))
    );
  }
}

class _Episodes extends ConsumerWidget {
  final List<Episode> episodes;
  final MediaDetail mediaDetail;
  const _Episodes({required this.episodes, required this.mediaDetail});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(getEpisodesProvider(mediaDetail.id, mediaDetail.id));
    return const SizedBox();
  }
}

/// 合集
class _Collections extends StatelessWidget {
  final List<MediaDetail> collections;
  const _Collections({required this.collections});

  @override
  Widget build(BuildContext context) {
    return const SizedBox();
  }
}

/// 相似影片
class _SimilarMedias extends ConsumerWidget{
  final MediaDetail medias;
  const _SimilarMedias({required this.medias});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(getSimilarProvider(medias.id));
    return data.when(
      data: (medias) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(width: StyleString.safeSpace),
                Text(
                  '相似影片',
                  style: StyleString.titleStyle,
                ),
              ],
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.18 + 50,
              child: medias.items.isEmpty ?
              const Center(child: Text('暂无数据')) :
              ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: medias.totalRecordCount,
                itemBuilder: (context, index) {
                  return Container(
                    width: MediaQuery.sizeOf(context).height * 0.117,
                    height: MediaQuery.sizeOf(context).height * 0.18,
                    margin: const EdgeInsets.only(
                      left: StyleString.safeSpace,
                    ),
                    child: MediaCardV(
                      media: medias.items[index],
                    ),
                  );
                },
              ),
            )
          ],
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stackTrace) => Center(child: Text('Error: $error$stackTrace')),
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