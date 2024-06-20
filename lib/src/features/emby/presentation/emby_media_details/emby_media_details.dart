

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:themby/src/common/constants.dart';
import 'package:themby/src/common/domiani/site.dart';
import 'package:themby/src/common/widget/network_img_layer.dart';
import 'package:themby/src/features/emby/application/emby_state_service.dart';
import 'package:themby/src/features/emby/data/image_repository.dart';
import 'package:themby/src/features/emby/data/view_repository.dart';
import 'package:themby/src/features/emby/domain/image_props.dart';
import 'package:themby/src/features/emby/domain/media_detail.dart';
import 'package:themby/src/features/emby/domain/people.dart';

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
          extendBodyBehindAppBar: true,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(50),
            child: _DetailAppBar(site: site!, mediaDetail: mediaDetail),
          ),
          body: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    _DetailBackground(mediaDetail: mediaDetail,site: site,),

                    _DetailContent(mediaDetail: mediaDetail,site: site),

                    const SizedBox(height: 10),
                    _DetailGenres(genres: mediaDetail.genres),

                    _DetailOverview(mediaDetail: mediaDetail, site: site),

                    _DetailPeople(people: mediaDetail.people, site: site),

                    _DetailPeople(people: mediaDetail.people, site: site),

                    _DetailPeople(people: mediaDetail.people, site: site),

                    _DetailPeople(people: mediaDetail.people, site: site),

                    const SizedBox(height: 80),

                  ],
                ),
              ),

              Positioned(
                left: 30,
                right: 30,
                bottom: 30,
                child: ClipRRect(
                  borderRadius: StyleString.lgRadius,
                  child: Container(
                    color: Theme.of(context).colorScheme.primary,
                    alignment: Alignment.center,
                    height: 50,
                    child: const Text(
                      '播放',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
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
    // final double heightBar = MediaQuery.sizeOf(context).width * 0.65;

    return AppBar(
      backgroundColor: Colors.transparent,
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
        centerTitle: true,
        title: Text(mediaDetail.name),
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
        SizedBox(height: 20),
        Container(
          height: height + 20,
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
              maxHeight: height * 0.3,
              maxWidth: width * 0.6,
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

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: StyleString.safeSpace),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                mediaDetail.productionYear.toString(),
                style: TextStyle(
                  fontSize: 15,
                  color: Theme.of(context).colorScheme.outline,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                mediaDetail.communityRating,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 10),
              const Icon(Icons.star, color: Colors.yellow, size: 20),
            ],
          )
        ],
      ),
    );
  }
}

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
          fontSize: 14,
          color: Colors.white38,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).colorScheme.primary;
    return Row(
      children: [
        const SizedBox(width: StyleString.safeSpace),
        Wrap(
          spacing: 6, // Change this value to adjust the space between items
          children: genres.map((genre) => buildTag(genre,color)).toList(),
        )
      ],
    );
  }
}


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
                  Padding(
                    padding: const EdgeInsets.all(StyleString.safeSpace),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          mediaDetail.name,
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
          style: const TextStyle(
            fontSize: 14,
            height: 1.5,
          ),
        ),
      ),
    );
  }
}

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