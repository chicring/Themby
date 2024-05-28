

class Image {
  String? primary;
  String? backdrop;
  String? logo;

  Image({
    this.primary,
    this.backdrop,
    this.logo,
  });

  Image.fromJson(Map<String, dynamic> json) {
    primary = json['Primary'];
    backdrop = json['Backdrop'];
    logo = json['Logo'];
  }
}