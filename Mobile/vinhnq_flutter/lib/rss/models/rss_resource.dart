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