

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:themby/src/common/constants.dart';
import 'package:themby/src/common/domiani/site.dart';
import 'package:themby/src/common/widget/dropdown_custom.dart';
import 'package:themby/src/common/widget/network_img_layer.dart';
import 'package:themby/src/features/emby/application/emby_state_service.dart';
import 'package:themby/src/features/emby/data/image_repository.dart';
import 'package:themby/src/features/emby/data/view_repository.dart';
import 'package:themby/src/features/emby/domain/image_props.dart';
import 'package:themby/src/features/emby/domain/media_detail.dart';
import 'package:themby/src/features/emby/domain/people.dart';
import 'package:themby/src/features/emby/domain/playback_info.dart';

class EmbyMediaDetails extends ConsumerWidget {
  final String id;
  const EmbyMediaDetails({super.key,required this.id});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final Site? site = ref.watch(embyStateServiceProvider.select((value) => value.site));

    final data = ref.watch(GetMediaProvider(id));
    // final double heightBar = MediaQuery.sizeOf(context).width * 0.65;

    return data.when(
      data: (mediaDetail) {
        return Scaffold(
          floatingActionButton: GestureDetector(
            onTap: (){
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: StyleString.safeSpace),
              decoration: BoxDecoration(
                borderRadius: StyleString.mdRadius,
                color: Theme.of(context).colorScheme.primary,
              ),
              width: MediaQuery.sizeOf(context).width,
              height: 50,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.play_arrow_outlined),
                  SizedBox(width: 10),
                  Text('播放', style: TextStyle(fontSize: 16)),
                ],
              ),
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
          body: CustomScrollView(
            slivers: [
              _DetailAppBar(site: site!, mediaDetail: mediaDetail),
              SliverList(
                delegate: SliverChildListDelegate(
                  [

                    const SizedBox(height: 10),
                    _DetailContent(mediaDetail: mediaDetail,site: site),

                    const SizedBox(height: 10),
                    _DetailGenres(genres: mediaDetail.genres),

                    const SizedBox(height: 10),
                    _DetailOverview(mediaDetail: mediaDetail, site: site),

                    const SizedBox(height: 10),
                    _DetailPeople(people: mediaDetail.people, site: site),

                    const SizedBox(height: 10),
                    _ExternalLinks(externalUrls: mediaDetail.externalUrls),

                    const SizedBox(height: 10),
                    _MediaDetail(mediaDetail: mediaDetail),

                    const SizedBox(height: 100),
                  ],
                ),
              ),
            ],
          )
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stackTrace) => Center(child: Text('Error: $error$stackTrace')),
    );
  }
}

class _DetailAppBar extends StatelessWidget {
  final Site site;
  final MediaDetail mediaDetail;
  const _DetailAppBar({required this.site, required this.mediaDetail});

  @override
  Widget build(BuildContext context) {
    final double heightBar = MediaQuery.sizeOf(context).width * 0.65;

    return SliverAppBar(
      expandedHeight: heightBar,
      pinned: true,
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
        titlePadding: const EdgeInsets.only(left: 45, bottom: 18),
        title: Text(
          mediaDetail.name,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
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
          top: 30,
          left: 50,
          child: Container(
            constraints: BoxConstraints(
              maxHeight: height * 0.2,
              maxWidth: width * 0.3,
              minHeight: height * 0.1,
              minWidth: width * 0.15,
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
              Text(
                _convertRuntimeTicksToMinutes(mediaDetail.runTimeTicks),
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal
                ),
              ),
              const SizedBox(width: 10),
              Text(
                mediaDetail.officialRating,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
          Row(
            children: [
              const Text('视频:', style: StyleString.subtitleStyle),
              const SizedBox(width: 10),
              DropdownMenuCustom(data: ['1','df','fd'], initialSelection: '1', onSelected: (value) => print(value)),
            ],
          ),
          Row(
            children: [
              Text('音频:', style: StyleString.subtitleStyle),
              const SizedBox(width: 10),

            ],
          ),
          Row(
            children: [
              Text('字幕:', style: StyleString.subtitleStyle),
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


  Widget buildTag(String genre,Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: color,
        borderRadius: StyleString.lgRadius,
      ),
      child: Text(
        genre,
        style: const TextStyle(
          fontSize: 13,
        ),
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
class _SimilarMedias extends StatelessWidget{
  final List<MediaDetail> medias;
  const _SimilarMedias({required this.medias});

  @override
  Widget build(BuildContext context) {

    return const SizedBox() ;
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