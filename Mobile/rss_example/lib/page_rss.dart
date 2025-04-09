import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rss_example/controller.dart';
import 'package:rss_example/page_url.dart';

import 'model.dart';

class PageRss extends StatelessWidget {
  PageRss({super.key});

  final controller = Get.put(RssController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        item.title,
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