import 'package:json_annotation/json_annotation.dart';

import 'image_tags.dart';
import 'media_stream.dart';

part 'media_source.g.dart';


@JsonSerializable()
class MediaSource {
  @JsonKey(name: "Protocol")
  String? protocol;
  @JsonKey(name: "Id")
  String? id;
  @JsonKey(name: "Path")
  String? path;
  @JsonKey(name: "EncoderPath")
  String? encoderPath;
  @JsonKey(name: "EncoderProtocol")
  String? encoderProtocol;
  @JsonKey(name: "Type")
  String? type;
  @JsonKey(name: "Container")
  String? container;
  @JsonKey(name: "Size")
  int? size;
  @JsonKey(name: "Name")
  String? name;
  @JsonKey(name: "IsRemote")
  bool? isRemote;
  @JsonKey(name: "RunTimeTicks")
  int? runTimeTicks;
  @JsonKey(name: "SupportsTranscoding")
  bool? supportsTranscoding;
  @JsonKey(name: "SupportsDirectStream")
  bool? supportsDirectStream;
  @JsonKey(name: "SupportsDirectPlay")
  bool? supportsDirectPlay;
  @JsonKey(name: "IsInfiniteStream")
  bool? isInfiniteStream;
  @JsonKey(name: "RequiresOpening")
  bool? requiresOpening;
  @JsonKey(name: "OpenToken")
  String? openToken;
  @JsonKey(name: "RequiresClosing")
  bool? requiresClosing;
  @JsonKey(name: "LiveStreamId")
  String? liveStreamId;
  @JsonKey(name: "BufferMs")
  int? bufferMs;
  @JsonKey(name: "RequiresLooping")
  bool? requiresLooping;
  @JsonKey(name: "SupportsProbing")
  bool? supportsProbing;
  @JsonKey(name: "Video3DFormat")
  String? video3DFormat;
  @JsonKey(name: "MediaStreams")
  List<MediaStream>? mediaStreams;
  @JsonKey(name: "Formats")
  List<String>? formats;
  @JsonKey(name: "Bitrate")
  int? bitrate;
  @JsonKey(name: "Timestamp")
  String? timestamp;
  @JsonKey(name: "RequiredHttpHeaders")
  ImageTags? requiredHttpHeaders;
  @JsonKey(name: "TranscodingUrl")
  String? transcodingUrl;
  @JsonKey(name: "TranscodingSubProtocol")
  String? transcodingSubProtocol;
  @JsonKey(name: "TranscodingContainer")
  String? transcodingContainer;
  @JsonKey(name: "AnalyzeDurationMs")
  int? analyzeDurationMs;
  @JsonKey(name: "ReadAtNativeFramerate")
  bool? readAtNativeFramerate;
  @JsonKey(name: "DefaultAudioStreamIndex")
  int? defaultAudioStreamIndex;
  @JsonKey(name: "DefaultSubtitleStreamIndex")
  int? defaultSubtitleStreamIndex;

  MediaSource({
    this.protocol,
    this.id,
    this.path,
    this.encoderPath,
    this.encoderProtocol,
    this.type,
    this.container,
    this.size,
    this.name,
    this.isRemote,
    this.runTimeTicks,
    this.supportsTranscoding,
    this.supportsDirectStream,
    this.supportsDirectPlay,
    this.isInfiniteStream,
    this.requiresOpening,
    this.openToken,
    this.requiresClosing,
    this.liveStreamId,
    this.bufferMs,
    this.requiresLooping,
    this.supportsProbing,
    this.video3DFormat,
    this.mediaStreams,
    this.formats,
    this.bitrate,
    this.timestamp,
    this.requiredHttpHeaders,
    this.transcodingUrl,
    this.transcodingSubProtocol,
    this.transcodingContainer,
    this.analyzeDurationMs,
    this.readAtNativeFramerate,
    this.defaultAudioStreamIndex,
    this.defaultSubtitleStreamIndex,
  });

  factory MediaSource.fromJson(Map<String, dynamic> json) => _$MediaSourceFromJson(json);

  Map<String, dynamic> toJson() => _$MediaSourceToJson(this);
}