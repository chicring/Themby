

class MediaStream {
  final String codec;
  final String language;
  final String displayTitle;
  final String displayLanguage;
  final bool isInterlaced;
  final bool isDefault;
  final bool isForced;
  final bool isHearingImpaired;
  final String type;
  final int index;
  final bool isExternal;
  final String deliveryMethod;
  final String deliveryUrl;
  final bool isExternalUrl;
  final bool isTextSubtitleStream;
  final bool supportsExternalStream;
  final String path;
  final String protocol;
  final String extendedVideoType;
  final String extendedVideoSubType;
  final String extendedVideoSubTypeDescription;
  final int attachmentSize;

  MediaStream({
    required this.codec,
    required this.language,
    required this.displayTitle,
    required this.displayLanguage,
    required this.isInterlaced,
    required this.isDefault,
    required this.isForced,
    required this.isHearingImpaired,
    required this.type,
    required this.index,
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
  });

  factory MediaStream.fromJson(Map<String, dynamic> json) {
    return MediaStream(
      codec: json['Codec'] ?? '',
      language: json['Language'] ?? '',
      displayTitle: json['DisplayTitle'] ?? '',
      displayLanguage: json['DisplayLanguage'] ?? '',
      isInterlaced: json['IsInterlaced'] ?? false,
      isDefault: json['IsDefault'] ?? false,
      isForced: json['IsForced'] ?? false,
      isHearingImpaired: json['IsHearingImpaired'] ?? false,
      type: json['Type'] ?? '',
      index: json['Index'] ?? 0,
      isExternal: json['IsExternal'] ?? false,
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
          .toList() ?? [],
      playSessionId: json['PlaySessionId'],
    );
  }
}