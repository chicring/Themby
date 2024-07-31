
import 'package:flutter/material.dart';
import 'package:themby/src/features/emby/domain/emby/media_stream.dart';

class MediaStreamCard extends StatelessWidget{
  const MediaStreamCard({super.key, required this.mediaStream});

  final MediaStream mediaStream;

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = const TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
    );

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Codec: ${mediaStream.codec ?? "N/A"}', style: textStyle),
            Text('Codec Tag: ${mediaStream.codecTag ?? "N/A"}', style: textStyle),
            Text('Language: ${mediaStream.language ?? "N/A"}', style: textStyle),
            Text('Color Transfer: ${mediaStream.colorTransfer ?? "N/A"}', style: textStyle),
            Text('Color Primaries: ${mediaStream.colorPrimaries ?? "N/A"}', style: textStyle),
            Text('Color Space: ${mediaStream.colorSpace ?? "N/A"}', style: textStyle),
            Text('Comment: ${mediaStream.comment ?? "N/A"}', style: textStyle),
            Text('Time Base: ${mediaStream.timeBase ?? "N/A"}', style: textStyle),
            Text('Codec Time Base: ${mediaStream.codecTimeBase ?? "N/A"}', style: textStyle),
            Text('Title: ${mediaStream.title ?? "N/A"}', style: textStyle),
            Text('Extradata: ${mediaStream.extradata ?? "N/A"}', style: textStyle),
            Text('Video Range: ${mediaStream.videoRange ?? "N/A"}', style: textStyle),
            Text('Display Title: ${mediaStream.displayTitle ?? "N/A"}', style: textStyle),
            Text('Display Language: ${mediaStream.displayLanguage ?? "N/A"}', style: textStyle),
            Text('Nal Length Size: ${mediaStream.nalLengthSize ?? "N/A"}', style: textStyle),
            Text('Is Interlaced: ${mediaStream.isInterlaced ?? "N/A"}', style: textStyle),
            Text('Is AVC: ${mediaStream.isAvc ?? "N/A"}', style: textStyle),
            Text('Channel Layout: ${mediaStream.channelLayout ?? "N/A"}', style: textStyle),
            Text('Bit Rate: ${mediaStream.bitRate ?? "N/A"}', style: textStyle),
            Text('Bit Depth: ${mediaStream.bitDepth ?? "N/A"}', style: textStyle),
            Text('Ref Frames: ${mediaStream.refFrames ?? "N/A"}', style: textStyle),
            Text('Packet Length: ${mediaStream.packetLength ?? "N/A"}', style: textStyle),
            Text('Channels: ${mediaStream.channels ?? "N/A"}', style: textStyle),
            Text('Sample Rate: ${mediaStream.sampleRate ?? "N/A"}', style: textStyle),
            Text('Is Default: ${mediaStream.isDefault ?? "N/A"}', style: textStyle),
            Text('Is Forced: ${mediaStream.isForced ?? "N/A"}', style: textStyle),
            Text('Height: ${mediaStream.height ?? "N/A"}', style: textStyle),
            Text('Width: ${mediaStream.width ?? "N/A"}', style: textStyle),
            Text('Average Frame Rate: ${mediaStream.averageFrameRate ?? "N/A"}', style: textStyle),
            Text('Real Frame Rate: ${mediaStream.realFrameRate ?? "N/A"}', style: textStyle),
            Text('Profile: ${mediaStream.profile ?? "N/A"}', style: textStyle),
            Text('Type: ${mediaStream.type ?? "N/A"}', style: textStyle),
            Text('Aspect Ratio: ${mediaStream.aspectRatio ?? "N/A"}', style: textStyle),
            Text('Index: ${mediaStream.index ?? "N/A"}', style: textStyle),
            Text('Score: ${mediaStream.score ?? "N/A"}', style: textStyle),
            Text('Is External: ${mediaStream.isExternal ?? "N/A"}', style: textStyle),
            Text('Delivery Method: ${mediaStream.deliveryMethod ?? "N/A"}', style: textStyle),
            Text('Delivery Url: ${mediaStream.deliveryUrl ?? "N/A"}', style: textStyle),
            Text('Is External Url: ${mediaStream.isExternalUrl ?? "N/A"}', style: textStyle),
            Text('Is Text Subtitle Stream: ${mediaStream.isTextSubtitleStream ?? "N/A"}', style: textStyle),
            Text('Supports External Stream: ${mediaStream.supportsExternalStream ?? "N/A"}', style: textStyle),
            Text('Path: ${mediaStream.path ?? "N/A"}', style: textStyle),
            Text('Pixel Format: ${mediaStream.pixelFormat ?? "N/A"}', style: textStyle),
            Text('Level: ${mediaStream.level ?? "N/A"}', style: textStyle),
            Text('Is Anamorphic: ${mediaStream.isAnamorphic ?? "N/A"}', style: textStyle),
          ],
        ),
      ),
    );
  }

}