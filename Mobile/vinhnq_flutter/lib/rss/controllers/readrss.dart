import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:thuc_hanh/rss/models/rss_item.dart';
import 'package:thuc_hanh/rss/models/rss_resource.dart';
import 'package:xml2json/xml2json.dart';

void main() async {
  var url = "https://vnexpress.net/rss/tin-noi-bat.rss";
  var response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    Xml2Json xml2json = Xml2Json();
    xml2json.parse(utf8.decode(response.bodyBytes));

    String jsonStr = xml2json.toParker();

    var data = json.decode(jsonStr)["rss"]["channel"]["item"][0];

    RssItem item = RssItem.empty().fromJson(data, rssResources[0]);

    print(item.imageUrl);
  }
}