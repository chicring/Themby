

import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:themby/src/common/domiani/site.dart';
import 'package:themby/src/features/emby/application/emby_state_service.dart';
import 'package:themby/src/features/emby/domain/playback_data.dart';
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
          "MaxStreamingBitrate": "600000000",
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


  Future<void> positionStart(String iId, int position, String pId, String mId, {CancelToken? cancelToken}) async {
    await client.postUri(
        Uri(
            scheme: site.scheme,
            host: site.host,
            port: site.port,
            path: '/emby/Sessions/Playing'
        ),
        options: Options(
          headers: {
            'X-Emby-Authorization': embyToken,
            'x-emby-token': site.accessToken,
          },
        ),

        data: PlaybackData(
            volumeLevel: 100,
            isMuted: false,
            isPaused: false,
            repeatMode: 'RepeatNone',
            playbackRate: 1,
            subtitleOffset: 0,
            maxStreamingBitrate: 2147483647,
            playbackStartTimeTicks: 0,
            positionTicks: position,
            subtitleStreamIndex: 0,
            audioStreamIndex: 0,
            playMethod: 'DirectStream',
            playSessionId: pId,
            mediaSourceId: mId,
            canSeek: true,
            itemId: iId,
            playlistLength: 1
        ).toJson()
    );
  }


  Future<void> positionBack(String iId, int position, String pId, String mId, {CancelToken? cancelToken}) async {
    await client.postUri(
        Uri(
            scheme: site.scheme,
            host: site.host,
            port: site.port,
            path: '/emby/Sessions/Playing/Progress'
        ),
        options: Options(
          headers: {
            'X-Emby-Authorization': embyToken,
            'x-emby-token': site.accessToken,
          },
        ),

        data: PlaybackData(
          volumeLevel: 100,
            isMuted: false,
            isPaused: false,
            repeatMode: 'RepeatNone',
            playbackRate: 1,
            subtitleOffset: 0,
            maxStreamingBitrate: 2147483647,
            playbackStartTimeTicks: 0,
            positionTicks: position,
            subtitleStreamIndex: 0,
            audioStreamIndex: 0,
            playMethod: 'DirectStream',
            playSessionId: pId,
            mediaSourceId: mId,
            canSeek: true,
            itemId: iId,
            eventName: 'timeupdate',
            playlistLength: 1
        ).toJson()
    );
  }

  Future<void> positionStop(String iId, int position, String pId, String mId, {CancelToken? cancelToken}) async {
    await client.postUri(
        Uri(
            scheme: site.scheme,
            host: site.host,
            port: site.port,
            path: '/emby/Sessions/Playing/Stopped'
        ),
        options: Options(
          headers: {
            'X-Emby-Authorization': embyToken,
            'x-emby-token': site.accessToken,
          },
        ),

        data: PlaybackData(
            volumeLevel: 100,
            isMuted: false,
            isPaused: false,
            repeatMode: 'RepeatNone',
            playbackRate: 1,
            subtitleOffset: 0,
            maxStreamingBitrate: 2147483647,
            playbackStartTimeTicks: 0,
            positionTicks: position,
            subtitleStreamIndex: 0,
            audioStreamIndex: 0,
            playMethod: 'DirectStream',
            playSessionId: pId,
            mediaSourceId: mId,
            canSeek: true,
            itemId: iId,
            eventName: 'pause',
            playlistLength: 1
        ).toJson()
    );
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
Future<String> getPlayerUrl(GetPlayerUrlRef ref,String itemId) async {
  final playbackInfo = await ref.read(getPlaybackInfoProvider(itemId).future);
  return markPlayUrl(playbackInfo.mediaSources, ref.read(embyStateServiceProvider.select((value) => value.site!)));
}

@riverpod
Future<void> positionStart(PositionStartRef ref, String iId, int position, String pId, String mId) => ref.read(playRepositoryProvider).positionStart(iId, position, pId, mId);

@riverpod
Future<void> positionBack(PositionBackRef ref, String iId, int position, String pId, String mId) => ref.read(playRepositoryProvider).positionBack(iId, position, pId, mId);

@riverpod
Future<void> positionStop(PositionStopRef ref, String iId, int position, String pId, String mId) => ref.read(playRepositoryProvider).positionStop(iId, position, pId, mId);

Future<String> markPlayUrl(List<MediaSource> sources, Site site) async {

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