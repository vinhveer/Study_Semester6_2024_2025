import 'package:flutter/material.dart';
import 'package:thuc_hanh/rss/controllers/rss_controller.dart';
import 'package:get/get.dart';
import 'package:thuc_hanh/rss/models/rss_item.dart';
import 'package:thuc_hanh/rss/pages/page_url.dart';

class PageRss extends StatelessWidget {
  PageRss({super.key});

  final controller = Get.put(RssController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("RSS"),
        actions: [
          GetBuilder(
              id: "header",
              init: controller,
              builder: (controller) {
                var list = controller.headerLabels;
                return DropdownButton<String>(
                  value: controller.currentHeaderLabel,
                  items: list.map(
                    (e) => DropdownMenuItem<String>(
                        value: e,
                        child: Text(e)
                    ),
                  ).toList(),
                  onChanged: (value) {
                    controller.changeHeader(value);
                  },
                );
              },
          ),
        ],
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          controller.refresh();
        },
        child: GetBuilder(
          id: "rss",
          init: controller,
          builder: (controller) => FutureBuilder<List<RssItem>>(
            future: controller.readRss(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(),
                      SizedBox(height: 16),
                      Text("Đang tải"),
                    ],
                  ),
                );
              }

              if (snapshot.hasError) {
                return Center(child: Text("Lỗi: ${snapshot.error}"));
              }

              if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return Center(child: Text("Không có dữ liệu"));
              }

              var list = snapshot.data!;

              return ListView.builder(
                itemCount: list.length,
                itemBuilder: (context, index) {
                  RssItem item = list[index];
                  return Card(
                    margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    child: ListTile(
                      leading: Image.network(
                        item.imageUrl,
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) =>
                            Icon(Icons.broken_image, size: 50),
                      ),
                      title: Text(
                        item.title ?? 'No title',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      subtitle: Text(item.description ?? 'No description'),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => PageUrl(
                            link: item.link,
                          ),
                        ));
                      },
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}