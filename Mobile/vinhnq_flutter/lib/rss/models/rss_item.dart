import 'package:thuc_hanh/rss/models/rss_resource.dart';

class RssItem {
  late String title;
  String? description;
  late String pubDate;
  late String link;
  late String imageUrl;

  RssItem.empty();
  RssItem fromJson(Map<String, dynamic> json, RssResource resource) {
    this.title = json["title"]!;
    this.imageUrl = getImageUrl(json["description"]!, resource)!;
    this.pubDate = json["pubDate"]!;
    this.link = json["link"]!;
    this.description = getDescriptionUrl(json["description"]!, resource);
    return this;
  }
}

String? getImageUrl(String rawDescription, RssResource resource) {
  String startRegex = resource.startImageRegex;
  String endRegex = resource.endImageRegex;

  int startIndex = rawDescription.indexOf(startRegex) + startRegex.length;

  if (startIndex >= startRegex.length) {
    if (endRegex.isNotEmpty) {
      int endIndex = rawDescription.indexOf(endRegex, startIndex);
      return rawDescription.substring(startIndex, endIndex);
    } else {
      return rawDescription.substring(startIndex);
    }
  }

  return null;
}

String? getDescriptionUrl(String rawDescription, RssResource resource) {
  String startRegex = resource.startDescriptionRegex;
  String endRegex = resource.endDescriptionRegex;

  int startIndex = rawDescription.indexOf(startRegex) + startRegex.length;


  if (startIndex >= startRegex.length) {
    if (endRegex.isNotEmpty) {
      int endIndex = rawDescription.indexOf(endRegex) + endRegex.length;
      return rawDescription.substring(startIndex, endIndex);
    } else {
      return rawDescription.substring(startIndex);
    }
  }

  return null;
}

