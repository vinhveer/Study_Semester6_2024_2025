import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:rss_example/model.dart';
import 'package:xml2json/xml2json.dart';

class RssController extends GetxController {
  late String currentUrl;
  late RssResource currentResource;
  late String currentHeaderLabel;
  late List<String> headerLabels;
  RxList<RssResource> resources = rssResources.obs;
  RxInt currentResourceIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    currentResource = resources[currentResourceIndex.value];
    headerLabels = currentResource.headers.keys.toList();
    currentHeaderLabel = headerLabels[0];
    currentUrl = currentResource.headers[currentHeaderLabel]!;
  }

  @override
  refresh() {
    update(["rss"]);
  }

  void changeResource(int index) {
    if (index != currentResourceIndex.value && index >= 0 && index < resources.length) {
      currentResourceIndex.value = index;
      currentResource = resources[index];
      headerLabels = currentResource.headers.keys.toList();
      currentHeaderLabel = headerLabels[0];
      currentUrl = currentResource.headers[currentHeaderLabel]!;
      update(["resource"]);
      update(["header"]);
      update(["rss"]);
    }
  }

  void changeHeader(String? value) {
    if (value != null) {
      if (value != currentHeaderLabel) {
        currentHeaderLabel = value;
        currentUrl = currentResource.headers[value]!;
        update(["header"]);
        update(["rss"]);
      }
    }
  }

  String getCurrentResourceName() {
    return currentResource.name;
  }

  List<String> getResourceNames() {
    return resources.map((resource) => resource.name).toList();
  }

  Future<List<RssItem>> readRss() async {
    try {
      var response = await http.get(Uri.parse(currentUrl));

      if (response.statusCode == 200) {
        Xml2Json xml2json = Xml2Json();
        xml2json.parse(utf8.decode(response.bodyBytes));

        String jsonStr = xml2json.toParker();

        var data = json.decode(jsonStr)["rss"]["channel"]["item"] as List;

        return data.map(
              (e) => RssItem.empty().fromJson(e, currentResource),
        ).toList();
      }

      return Future.error("Có lỗi xảy ra khi tải dữ liệu");
    } catch (e) {
      return Future.error("Có lỗi xảy ra: ${e.toString()}");
    }
  }

  // Thêm nguồn tin mới
  void addResource(RssResource newResource) {
    if (!resources.any((resource) => resource.id == newResource.id)) {
      resources.add(newResource);
      update(["resource"]);
    }
  }

  // Xóa nguồn tin
  void removeResource(String resourceId) {
    if (resources.length > 1) {
      int indexToRemove = resources.indexWhere((resource) => resource.id == resourceId);
      if (indexToRemove >= 0) {
        resources.removeAt(indexToRemove);

        // Nếu xóa nguồn tin đang được chọn
        if (currentResourceIndex.value == indexToRemove) {
          currentResourceIndex.value = 0;
          currentResource = resources[0];
          headerLabels = currentResource.headers.keys.toList();
          currentHeaderLabel = headerLabels[0];
          currentUrl = currentResource.headers[currentHeaderLabel]!;
        } else if (currentResourceIndex.value > indexToRemove) {
          // Điều chỉnh chỉ số nếu xóa một nguồn tin trước nguồn hiện tại
          currentResourceIndex.value--;
        }

        update(["resource"]);
        update(["header"]);
        update(["rss"]);
      }
    }
  }
}