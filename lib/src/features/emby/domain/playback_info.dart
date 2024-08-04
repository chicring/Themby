

class MediaStream {
  final String title;
  final String codec;
  final String language;
  final String profile;
  final String displayTitle;
  final String displayLanguage;
  final bool isInterlaced;
  final bool isDefault;
  final bool isForced;
  final bool isHearingImpaired;
  final String type;
  final int level;
  final int index;
  final int height;
  final int width;
  final bool isExternal;
  final String deliveryMethod;
  final String deliveryUrl;
  final bool isExternalUrl;
  final bool isTextSubtitleStream;
  final bool supportsExternalStream;
  final String aspectRatio;
  final String path;
  final String protocol;
  final String extendedVideoType;
  final String extendedVideoSubType;
  final String extendedVideoSubTypeDescription;
  final int attachmentSize;
  final double averageFrameRate;
  final int bitDepth;
  final String pixelFormat;
  final String channelLayout;
  final int channels;
  final int sampleRate;

  MediaStream({
    required this.title,
    required this.codec,
    required this.language,
    required this.displayTitle,
    required this.profile,
    required this.displayLanguage,
    required this.isInterlaced,
    required this.isDefault,
    required this.isForced,
    required this.isHearingImpaired,
    required this.type,
    required this.level,
    required this.index,
    required this.height,
    required this.width,
    required this.aspectRatio,
    required this.isExternal,
    required this.deliveryMethod,
    required this.deliveryUrl,
    required this.isExternalUrl,
    required this.isTextSubtitleStream,
    required this.supportsExternalStream,
    required this.path,
    required this.protocol,
    required this.extendedVideoType,
    required this.extendedVideoSubType,
    required this.extendedVideoSubTypeDescription,
    required this.attachmentSize,
    required this.averageFrameRate,
    required this.bitDepth,
    required this.pixelFormat,
    required this.channelLayout,
    required this.channels,
    required this.sampleRate,
  });

  factory MediaStream.fromJson(Map<String, dynamic> json) {
    return MediaStream(
      title: json['Title'] ?? '',
      codec: json['Codec'] ?? '',
      language: json['Language'] ?? '',
      displayTitle: json['DisplayTitle'] ?? '',
      profile: json['Profile'] ?? '',
      displayLanguage: json['DisplayLanguage'] ?? '',
      isInterlaced: json['IsInterlaced'] ?? false,
      isDefault: json['IsDefault'] ?? false,
      isForced: json['IsForced'] ?? false,
      isHearingImpaired: json['IsHearingImpaired'] ?? false,
      type: json['Type'] ?? '',
      index: json['Index'] ?? 0,
      height: json['Height'] ?? 0,
      width: json['Width'] ?? 0,
      isExternal: json['IsExternal'] ?? false,
      aspectRatio: json['AspectRatio'] ?? '',
      deliveryMethod: json['DeliveryMethod'] ?? '',
      deliveryUrl: json['DeliveryUrl'] ?? '',
      isExternalUrl: json['IsExternalUrl'] ?? false,
      isTextSubtitleStream: json['IsTextSubtitleStream'] ?? false,
      supportsExternalStream: json['SupportsExternalStream'] ?? false,
      path: json['Path'] ?? '',
      protocol: json['Protocol'] ?? '',
      extendedVideoType: json['ExtendedVideoType'] ?? '',
      extendedVideoSubType: json['ExtendedVideoSubType'] ?? '',
      extendedVideoSubTypeDescription: json['ExtendedVideoSubTypeDescription'] ?? '',
      attachmentSize: json['AttachmentSize'] ?? 0,
      level: json['Level'] ?? 0,
      averageFrameRate: (json['AverageFrameRate'] as num?)?.toDouble() ?? 0.0,
      bitDepth: json['BitDepth'] ?? 0,
      pixelFormat: json['PixelFormat'] ?? '',
      channelLayout: json['AudioChannelLayout'] ?? '',
      channels: json['Channels'] ?? 0,
      sampleRate: json['SampleRate'] ?? 0,
    );
  }
}


class MediaSource {
  final String id;
  final String container;
  final String directStreamUrl;
  final String path;
  final String transcodingUrl;
  final String name;
  final int size;
  final List<MediaStream> mediaStreams;

  MediaSource({
    required this.id,
    required this.container,
    required this.directStreamUrl,
    required this.path,
    required this.transcodingUrl,
    required this.name,
    required this.size,
    required this.mediaStreams,
  });

  factory MediaSource.fromJson(Map<String, dynamic> json) {
    return MediaSource(
      id: json['Id'] ?? '',
      container: json['Container'] ?? '',
      directStreamUrl: json['DirectStreamUrl'] ?? '',
      path: json['Path'] ?? '',
      transcodingUrl: json['TranscodingUrl'] ?? '',
      name: json['Name'] ?? '',
      size: json['Size'] ?? 0,
      mediaStreams: (json['MediaStreams'] as List)
          .map((item) => MediaStream.fromJson(item))
          .toList(),
    );
  }
}


class PlaybackInfo {
  final List<MediaSource> mediaSources;
  final String playSessionId;

  PlaybackInfo({
    required this.mediaSources,
    required this.playSessionId,
  });

  factory PlaybackInfo.fromJson(Map<String, dynamic> json) {
    return PlaybackInfo(
      mediaSources: (json['MediaSources'] as List)
          .map((item) => MediaSource.fromJson(item))
          .toList(),
      playSessionId: json['PlaySessionId'],
    );
  }
}