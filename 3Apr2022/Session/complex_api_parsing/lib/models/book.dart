import 'package:complex_api_parsing/models/volume_info.dart';

class Book {
  String? id;
  VolumeInfo? volumeInfo;

  Book({this.volumeInfo});

  factory Book.fromJson(Map<String, dynamic> json) {
    var bookParsed = Book();
    bookParsed.id = json['id'];
    bookParsed.volumeInfo = VolumeInfo.fromJson(json['volumeInfo']);
    return bookParsed;
  }
}
