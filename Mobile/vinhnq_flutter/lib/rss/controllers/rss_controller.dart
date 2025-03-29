import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:thuc_hanh/rss/models/rss_resource.dart';
import 'package:xml2json/xml2json.dart';

import '../models/rss_item.dart';

class RssController extends GetxController {
  late String currentUrl;
  late RssResource currentResource;
  late String currentHeaderLabel;
  late List<String> headerLabels;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    currentResource = rssResources[0];
    headerLabels = currentResource.headers.keys.toList();
    currentHeaderLabel = headerLabels[0];
    currentUrl = currentResource.headers.values.toList()[0];
  }

  refresh() {
    update(["rss"]);
  }

  changeHeader(String? value) {
    if (value != null) {
      if (value != currentHeaderLabel) {
        currentHeaderLabel = value;
        currentUrl = currentResource.headers[value]!;
        update(["header"]);
        update(["rss"]);
      }
    }
  }

  Future<List<RssItem>> readRss() async {
    var url = "https://vnexpress.net/rss/tin-noi-bat.rss";
    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      Xml2Json xml2json = Xml2Json();
      xml2json.parse(utf8.decode(response.bodyBytes));

      String jsonStr = xml2json.toParker();

      var data = json.decode(jsonStr)["rss"]["channel"]["item"] as List;

      return data.map(
        (e) => RssItem.empty().fromJson(e, currentResource),
      ).toList();
    }

    return Future.error("Có lỗi xảy ra");
  }
}