
class ImageTags{
  String? primary;
  String? backdrop;
  String? logo;
  String? thumb;
  String? banner;

  ImageTags({
    this.primary,
    this.backdrop,
    this.logo,
    this.thumb,
    this.banner,
  });

  factory ImageTags.fromJson(Map<String, dynamic> json){
    return ImageTags(
      primary: json['Primary'],
      backdrop: json['Backdrop'],
      logo: json['Logo'],
      thumb: json['Thumb'],
      banner: json['Banner'],
    );
  }
}