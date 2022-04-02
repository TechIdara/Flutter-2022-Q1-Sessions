import 'package:complex_api_parsing/models/image_links.dart';

class VolumeInfo {
  String? title;
  List<String>? authors;
  ImageLinks? imageLinks;

  VolumeInfo({this.title, this.authors, this.imageLinks});

  factory VolumeInfo.fromJson(Map<String, dynamic> json) {
    var volumeInfoParsed = VolumeInfo();
    volumeInfoParsed.title = json['title'];
    volumeInfoParsed.authors = [];
    for (var authorStr in json['authors']) {
      volumeInfoParsed.authors?.add(authorStr as String);
    }
    volumeInfoParsed.imageLinks = ImageLinks.fromJson(json['imageLinks']);
    return volumeInfoParsed;
  }
}
