import 'dart:convert';
import 'package:http/http.dart' as http;

class Album {
  int albumId, id;
  String title, url, thumbnailUrl;

  Album({
    required this.albumId,
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });



  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
        albumId: json['albumId'],
        id: json['id'],
        title: json['title'],
        url: json['url'],
        thumbnailUrl: json['thumbnailUrl']
    );
  }



  Map<String, dynamic> toMap() {
    return {
      'albumId': albumId,
      'id': id,
      'title': title,
      'url': url,
      'thumbnailUrl': thumbnailUrl,
    };
  }

  factory Album.fromMap(Map<String, dynamic> map) {
    return Album(
      albumId: map['albumId'] as int,
      id: map['id'] as int,
      title: map['title'] as String,
      url: map['url'] as String,
      thumbnailUrl: map['thumbnailUrl'] as String,
    );
  }
}

Future<List<Album>> downloadData() async {
  var response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/photos"));

  if (response.statusCode == 200) {
    var list = json.decode(response.body) as List; // List các Map<String, dynamic> Object
    List<Album> albums;
    albums = list.map(
          (e) => Album.fromJson(e),
    ).toList();

    return albums;
  }
  return Future.error(response.statusCode);
}