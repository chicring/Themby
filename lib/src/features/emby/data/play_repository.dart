

import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:themby/src/common/domiani/site.dart';
import 'package:themby/src/features/emby/application/emby_state_service.dart';
import 'package:themby/src/features/emby/domain/media_detail.dart';
import 'package:themby/src/features/emby/domain/playback_info.dart';
import 'package:themby/src/helper/dio_provider.dart';
import 'device.dart';

part 'play_repository.g.dart';

class PlayRepository{

  final Dio client;
  final Site site;
  final String embyToken;

  PlayRepository({
    required this.client,
    required this.site,
    required this.embyToken,
  });

  Future<PlaybackInfo> getPlaybackInfo(String itemId) async {
    final response = await client.postUri(
      Uri(
        scheme: site.scheme,
        host: site.host,
        port: site.port,
        path: '/emby/Items/$itemId/PlaybackInfo',
        queryParameters: {
          'StartTimeTicks': '0',
          "UserId": site.userId,
          "AutoOpenLiveStream": "false",
          "IsPlayback": "false",
          "AudioStreamIndex": "1",
          "SubtitleStreamIndex": "1",
          "MaxStreamingBitrate": "160000000",
          "reqformat": "json",
        },
      ),
      options: Options(
        headers: {
          'X-Emby-Authorization': embyToken,
          'x-emby-token': site.accessToken,
        },
      ),
      data: device
    );

    return PlaybackInfo.fromJson(response.data);
  }

  Future<String> getPlayUrl(List<MediaSource> sources) async {

    final List<String> urls = sources.map((source) {
      if (source.container == 'strm') {
        return source.path;
      } else {
        return source.directStreamUrl;
      }
    }).toList();

    if (urls.isNotEmpty) {
      return '${site.scheme}://${site.host}:${site.port}/emby${urls.first}';
    } else {
      return '';
    }
  }
}


@riverpod
PlayRepository playRepository(PlayRepositoryRef ref) => PlayRepository(
  client: ref.watch(dioProvider),
  site: ref.watch(embyStateServiceProvider.select((value) => value.site!)),
  embyToken: ref.watch(embyStateServiceProvider.select((value) => value.token)),
);


@riverpod
Future<PlaybackInfo> getPlaybackInfo(GetPlaybackInfoRef ref, String itemId) => ref.read(playRepositoryProvider).getPlaybackInfo(itemId);

@riverpod
Future<String> playUrl(PlayUrlRef ref, List<MediaSource> sources) => ref.read(playRepositoryProvider).getPlayUrl(sources);