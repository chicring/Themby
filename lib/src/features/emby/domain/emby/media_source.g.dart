// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_source.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MediaSource _$MediaSourceFromJson(Map<String, dynamic> json) => MediaSource(
      protocol: json['Protocol'] as String?,
      id: json['Id'] as String?,
      path: json['Path'] as String?,
      encoderPath: json['EncoderPath'] as String?,
      encoderProtocol: json['EncoderProtocol'] as String?,
      type: json['Type'] as String?,
      container: json['Container'] as String?,
      size: (json['Size'] as num?)?.toInt(),
      name: json['Name'] as String?,
      isRemote: json['IsRemote'] as bool?,
      runTimeTicks: (json['RunTimeTicks'] as num?)?.toInt(),
      supportsTranscoding: json['SupportsTranscoding'] as bool?,
      supportsDirectStream: json['SupportsDirectStream'] as bool?,
      supportsDirectPlay: json['SupportsDirectPlay'] as bool?,
      isInfiniteStream: json['IsInfiniteStream'] as bool?,
      requiresOpening: json['RequiresOpening'] as bool?,
      openToken: json['OpenToken'] as String?,
      requiresClosing: json['RequiresClosing'] as bool?,
      liveStreamId: json['LiveStreamId'] as String?,
      bufferMs: (json['BufferMs'] as num?)?.toInt(),
      requiresLooping: json['RequiresLooping'] as bool?,
      supportsProbing: json['SupportsProbing'] as bool?,
      video3DFormat: json['Video3DFormat'] as String?,
      mediaStreams: (json['MediaStreams'] as List<dynamic>?)
          ?.map((e) => MediaStream.fromJson(e as Map<String, dynamic>))
          .toList(),
      formats:
          (json['Formats'] as List<dynamic>?)?.map((e) => e as String).toList(),
      bitrate: (json['Bitrate'] as num?)?.toInt(),
      timestamp: json['Timestamp'] as String?,
      requiredHttpHeaders: json['RequiredHttpHeaders'] == null
          ? null
          : ImageTags.fromJson(
              json['RequiredHttpHeaders'] as Map<String, dynamic>),
      transcodingUrl: json['TranscodingUrl'] as String?,
      transcodingSubProtocol: json['TranscodingSubProtocol'] as String?,
      transcodingContainer: json['TranscodingContainer'] as String?,
      analyzeDurationMs: (json['AnalyzeDurationMs'] as num?)?.toInt(),
      readAtNativeFramerate: json['ReadAtNativeFramerate'] as bool?,
      defaultAudioStreamIndex:
          (json['DefaultAudioStreamIndex'] as num?)?.toInt(),
      defaultSubtitleStreamIndex:
          (json['DefaultSubtitleStreamIndex'] as num?)?.toInt(),
    );

Map<String, dynamic> _$MediaSourceToJson(MediaSource instance) =>
    <String, dynamic>{
      'Protocol': instance.protocol,
      'Id': instance.id,
      'Path': instance.path,
      'EncoderPath': instance.encoderPath,
      'EncoderProtocol': instance.encoderProtocol,
      'Type': instance.type,
      'Container': instance.container,
      'Size': instance.size,
      'Name': instance.name,
      'IsRemote': instance.isRemote,
      'RunTimeTicks': instance.runTimeTicks,
      'SupportsTranscoding': instance.supportsTranscoding,
      'SupportsDirectStream': instance.supportsDirectStream,
      'SupportsDirectPlay': instance.supportsDirectPlay,
      'IsInfiniteStream': instance.isInfiniteStream,
      'RequiresOpening': instance.requiresOpening,
      'OpenToken': instance.openToken,
      'RequiresClosing': instance.requiresClosing,
      'LiveStreamId': instance.liveStreamId,
      'BufferMs': instance.bufferMs,
      'RequiresLooping': instance.requiresLooping,
      'SupportsProbing': instance.supportsProbing,
      'Video3DFormat': instance.video3DFormat,
      'MediaStreams': instance.mediaStreams,
      'Formats': instance.formats,
      'Bitrate': instance.bitrate,
      'Timestamp': instance.timestamp,
      'RequiredHttpHeaders': instance.requiredHttpHeaders,
      'TranscodingUrl': instance.transcodingUrl,
      'TranscodingSubProtocol': instance.transcodingSubProtocol,
      'TranscodingContainer': instance.transcodingContainer,
      'AnalyzeDurationMs': instance.analyzeDurationMs,
      'ReadAtNativeFramerate': instance.readAtNativeFramerate,
      'DefaultAudioStreamIndex': instance.defaultAudioStreamIndex,
      'DefaultSubtitleStreamIndex': instance.defaultSubtitleStreamIndex,
    };
