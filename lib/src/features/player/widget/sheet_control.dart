import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:themby/src/features/emby/domain/episode.dart';
import 'package:themby/src/features/emby/presentation/widget/episode_card.dart';
import 'package:themby/src/features/player/service/medias_service.dart';


Widget episodeSheet(List<Episode> episodes){
  return Container(
    width: 300,
    color: Colors.black.withOpacity(0.85),
    padding: const EdgeInsets.all(10),
    child: ListView.builder(
      itemCount: episodes.length,
      itemBuilder: (context, index) {
        return SizedBox(
          width: 160,
          height: 90,
          child: EpisodeCard(episode: episodes[index]),
        );
      },
    ),
  );
}