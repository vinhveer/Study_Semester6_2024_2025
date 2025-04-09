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

class RssResource {
  String id, name;
  String startImageRegex, endImageRegex;
  String startDescriptionRegex, endDescriptionRegex;

  Map<String, String> headers;

  RssResource({
    required this.id,
    required this.name,
    required this.startImageRegex,
    required this.endImageRegex,
    required this.startDescriptionRegex,
    required this.endDescriptionRegex,
    required this.headers
  });
}

List<RssResource> rssResources = [
  RssResource(
      id: "vnexpress",
      name: "Vnexpress",
      startImageRegex: 'img src="',
      endImageRegex: '"',
      startDescriptionRegex: "</a></br>",
      endDescriptionRegex: "",
      headers: {
        "Trang chủ": "https://vnexpress.net/rss/tin-noi-bat.rss",
        "Sức khỏe": "https://vnexpress.net/rss/suc-khoe.rss",
        "Kinh doanh": "https://vnexpress.net/rss/kinh-doanh.rss",
        "Giải trí": "https://vnexpress.net/rss/giai-tri.rss",
      }
  ),
  RssResource(
      id: "tuoitre",
      name: "Tuổi trẻ",
      startImageRegex: 'img src="',
      endImageRegex: "/",
      startDescriptionRegex: "</a>",
      endDescriptionRegex: "",
      headers: {
        "Trang chủ": "https://tuoitre.vn/rss/tin-moi-nhat.rss",
        "Sức khỏe": "https://tuoitre.vn/rss/suc-khoe.rss",
        "Kinh doanh": "https://tuoitre.vn/rss/kinh-doanh.rss",
        "Giải trí": "https://tuoitre.vn/rss/giai-tri.rss",
      }
  ),
];