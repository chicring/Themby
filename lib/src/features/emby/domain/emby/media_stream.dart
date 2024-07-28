import 'package:json_annotation/json_annotation.dart';

part 'media_stream.g.dart';

@JsonSerializable()
class MediaStream {
  @JsonKey(name: "Codec")
  String? codec;
  @JsonKey(name: "CodecTag")
  String? codecTag;
  @JsonKey(name: "Language")
  String? language;
  @JsonKey(name: "ColorTransfer")
  String? colorTransfer;
  @JsonKey(name: "ColorPrimaries")
  String? colorPrimaries;
  @JsonKey(name: "ColorSpace")
  String? colorSpace;
  @JsonKey(name: "Comment")
  String? comment;
  @JsonKey(name: "TimeBase")
  String? timeBase;
  @JsonKey(name: "CodecTimeBase")
  String? codecTimeBase;
  @JsonKey(name: "Title")
  String? title;
  @JsonKey(name: "Extradata")
  String? extradata;
  @JsonKey(name: "VideoRange")
  String? videoRange;
  @JsonKey(name: "DisplayTitle")
  String? displayTitle;
  @JsonKey(name: "DisplayLanguage")
  String? displayLanguage;
  @JsonKey(name: "NalLengthSize")
  String? nalLengthSize;
  @JsonKey(name: "IsInterlaced")
  bool? isInterlaced;
  @JsonKey(name: "IsAVC")
  bool? isAvc;
  @JsonKey(name: "ChannelLayout")
  String? channelLayout;
  @JsonKey(name: "BitRate")
  int? bitRate;
  @JsonKey(name: "BitDepth")
  int? bitDepth;
  @JsonKey(name: "RefFrames")
  int? refFrames;
  @JsonKey(name: "PacketLength")
  int? packetLength;
  @JsonKey(name: "Channels")
  int? channels;
  @JsonKey(name: "SampleRate")
  int? sampleRate;
  @JsonKey(name: "IsDefault")
  bool? isDefault;
  @JsonKey(name: "IsForced")
  bool? isForced;
  @JsonKey(name: "Height")
  int? height;
  @JsonKey(name: "Width")
  int? width;
  @JsonKey(name: "AverageFrameRate")
  int? averageFrameRate;
  @JsonKey(name: "RealFrameRate")
  int? realFrameRate;
  @JsonKey(name: "Profile")
  String? profile;
  @JsonKey(name: "Type")
  String? type;
  @JsonKey(name: "AspectRatio")
  String? aspectRatio;
  @JsonKey(name: "Index")
  int? index;
  @JsonKey(name: "Score")
  int? score;
  @JsonKey(name: "IsExternal")
  bool? isExternal;
  @JsonKey(name: "DeliveryMethod")
  String? deliveryMethod;
  @JsonKey(name: "DeliveryUrl")
  String? deliveryUrl;
  @JsonKey(name: "IsExternalUrl")
  bool? isExternalUrl;
  @JsonKey(name: "IsTextSubtitleStream")
  bool? isTextSubtitleStream;
  @JsonKey(name: "SupportsExternalStream")
  bool? supportsExternalStream;
  @JsonKey(name: "Path")
  String? path;
  @JsonKey(name: "PixelFormat")
  String? pixelFormat;
  @JsonKey(name: "Level")
  int? level;
  @JsonKey(name: "IsAnamorphic")
  bool? isAnamorphic;

  MediaStream({
    this.codec,
    this.codecTag,
    this.language,
    this.colorTransfer,
    this.colorPrimaries,
    this.colorSpace,
    this.comment,
    this.timeBase,
    this.codecTimeBase,
    this.title,
    this.extradata,
    this.videoRange,
    this.displayTitle,
    this.displayLanguage,
    this.nalLengthSize,
    this.isInterlaced,
    this.isAvc,
    this.channelLayout,
    this.bitRate,
    this.bitDepth,
    this.refFrames,
    this.packetLength,
    this.channels,
    this.sampleRate,
    this.isDefault,
    this.isForced,
    this.height,
    this.width,
    this.averageFrameRate,
    this.realFrameRate,
    this.profile,
    this.type,
    this.aspectRatio,
    this.index,
    this.score,
    this.isExternal,
    this.deliveryMethod,
    this.deliveryUrl,
    this.isExternalUrl,
    this.isTextSubtitleStream,
    this.supportsExternalStream,
    this.path,
    this.pixelFormat,
    this.level,
    this.isAnamorphic,
  });

  factory MediaStream.fromJson(Map<String, dynamic> json) => _$MediaStreamFromJson(json);

  Map<String, dynamic> toJson() => _$MediaStreamToJson(this);
}