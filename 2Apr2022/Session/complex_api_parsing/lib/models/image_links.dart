class ImageLinks {
  String? thumbnail;

  ImageLinks({this.thumbnail});

  factory ImageLinks.fromJson(Map<String, dynamic> json) {
    var imageLinks = ImageLinks();
    imageLinks.thumbnail = json['thumbnail'];
    return imageLinks;
  }
}
