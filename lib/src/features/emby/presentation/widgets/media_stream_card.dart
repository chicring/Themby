
import 'package:flutter/material.dart';
import 'package:themby/src/features/emby/domain/emby/media_stream.dart';

final Map<String, IconData> typeIcons = {
  'Audio': Icons.audiotrack,
  'Video': Icons.videocam,
  'Subtitle': Icons.subtitles,
  'EmbeddedImage': Icons.image,
};

class MediaStreamCard extends StatelessWidget {
  const MediaStreamCard({super.key, required this.mediaStream});

  final MediaStream mediaStream;

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = TextStyle(
      fontSize: 11,
      fontWeight: FontWeight.bold,
      color: Theme.of(context).textTheme.bodyMedium?.color,
    );

    return Card(
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              typeIcons[mediaStream.type] ?? Icons.help_outline,
              size: 24.0,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(height: 6),
            if (mediaStream.codec != null) Text('Codec: ${mediaStream.codec}', style: textStyle),
            if (mediaStream.codecTag != null) Text('Codec Tag: ${mediaStream.codecTag}', style: textStyle),
            if (mediaStream.language != null) Text('Language: ${mediaStream.language}', style: textStyle),
            if (mediaStream.colorTransfer != null) Text('Color Transfer: ${mediaStream.colorTransfer}', style: textStyle),
            if (mediaStream.colorPrimaries != null) Text('Color Primaries: ${mediaStream.colorPrimaries}', style: textStyle),
            if (mediaStream.colorSpace != null) Text('Color Space: ${mediaStream.colorSpace}', style: textStyle),
            if (mediaStream.comment != null) Text('Comment: ${mediaStream.comment}', style: textStyle),
            if (mediaStream.timeBase != null) Text('Time Base: ${mediaStream.timeBase}', style: textStyle),
            if (mediaStream.codecTimeBase != null) Text('Codec Time Base: ${mediaStream.codecTimeBase}', style: textStyle),
            if (mediaStream.title != null) Text('Title: ${mediaStream.title}', style: textStyle),
            if (mediaStream.extradata != null) Text('Extradata: ${mediaStream.extradata}', style: textStyle),
            if (mediaStream.videoRange != null) Text('Video Range: ${mediaStream.videoRange}', style: textStyle),
            if (mediaStream.displayTitle != null) Text('Display Title: ${mediaStream.displayTitle}', style: textStyle),
            if (mediaStream.displayLanguage != null) Text('Display Language: ${mediaStream.displayLanguage}', style: textStyle),
            if (mediaStream.nalLengthSize != null) Text('Nal Length Size: ${mediaStream.nalLengthSize}', style: textStyle),
            if (mediaStream.isInterlaced != null) Text('Is Interlaced: ${mediaStream.isInterlaced}', style: textStyle),
            if (mediaStream.isAvc != null) Text('Is AVC: ${mediaStream.isAvc}', style: textStyle),
            if (mediaStream.channelLayout != null) Text('Channel Layout: ${mediaStream.channelLayout}', style: textStyle),
            if (mediaStream.bitRate != null) Text('Bit Rate: ${mediaStream.bitRate}', style: textStyle),
            if (mediaStream.bitDepth != null) Text('Bit Depth: ${mediaStream.bitDepth}', style: textStyle),
            if (mediaStream.refFrames != null) Text('Ref Frames: ${mediaStream.refFrames}', style: textStyle),
            if (mediaStream.packetLength != null) Text('Packet Length: ${mediaStream.packetLength}', style: textStyle),
            if (mediaStream.channels != null) Text('Channels: ${mediaStream.channels}', style: textStyle),
            if (mediaStream.sampleRate != null) Text('Sample Rate: ${mediaStream.sampleRate}', style: textStyle),
            if (mediaStream.isDefault != null) Text('Is Default: ${mediaStream.isDefault}', style: textStyle),
            if (mediaStream.isForced != null) Text('Is Forced: ${mediaStream.isForced}', style: textStyle),
            if (mediaStream.height != null) Text('Height: ${mediaStream.height}', style: textStyle),
            if (mediaStream.width != null) Text('Width: ${mediaStream.width}', style: textStyle),
            if (mediaStream.averageFrameRate != null) Text('Average Frame Rate: ${mediaStream.averageFrameRate}', style: textStyle),
            if (mediaStream.realFrameRate != null) Text('Real Frame Rate: ${mediaStream.realFrameRate}', style: textStyle),
            if (mediaStream.profile != null) Text('Profile: ${mediaStream.profile}', style: textStyle),
            if (mediaStream.type != null) Text('Type: ${mediaStream.type}', style: textStyle),
            if (mediaStream.aspectRatio != null) Text('Aspect Ratio: ${mediaStream.aspectRatio}', style: textStyle),
            if (mediaStream.index != null) Text('Index: ${mediaStream.index}', style: textStyle),
            if (mediaStream.score != null) Text('Score: ${mediaStream.score}', style: textStyle),
            if (mediaStream.isExternal != null) Text('Is External: ${mediaStream.isExternal}', style: textStyle),
            if (mediaStream.deliveryMethod != null) Text('Delivery Method: ${mediaStream.deliveryMethod}', style: textStyle),
            if (mediaStream.deliveryUrl != null) Text('Delivery Url: ${mediaStream.deliveryUrl}', style: textStyle),
            if (mediaStream.isExternalUrl != null) Text('Is External Url: ${mediaStream.isExternalUrl}', style: textStyle),
            if (mediaStream.isTextSubtitleStream != null) Text('Is Text Subtitle Stream: ${mediaStream.isTextSubtitleStream}', style: textStyle),
            if (mediaStream.supportsExternalStream != null) Text('Supports External Stream: ${mediaStream.supportsExternalStream}', style: textStyle),
            if (mediaStream.path != null) Text('Path: ${mediaStream.path}', style: textStyle),
            if (mediaStream.pixelFormat != null) Text('Pixel Format: ${mediaStream.pixelFormat}', style: textStyle),
            if (mediaStream.level != null) Text('Level: ${mediaStream.level}', style: textStyle),
            if (mediaStream.isAnamorphic != null) Text('Is Anamorphic: ${mediaStream.isAnamorphic}', style: textStyle),
          ],
        ),
      ),
    );
  }
}