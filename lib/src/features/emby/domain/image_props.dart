enum ImageType {
  primary,
  backdrop,
  logo,
  thumb,
  banner
}

class ImageProps {
  final int? maxHeight;
  final int? maxWidth;
  final int? quality;
  final String? tag;
  final ImageType? type;

  ImageProps({
    this.maxHeight,
    this.maxWidth,
    this.quality,
    this.tag,
    this.type = ImageType.primary,
  });
}