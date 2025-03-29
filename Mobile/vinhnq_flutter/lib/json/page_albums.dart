import 'package:flutter/material.dart';
import 'package:thuc_hanh/json/json_data.dart';

class PageAlbums extends StatelessWidget {
  const PageAlbums({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Json Album"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: FutureBuilder<List<Album>>(
        future: downloadData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print(snapshot.error);
            return Center(
              child: Text(
                "Lỗi: ${snapshot.error}",
                style: TextStyle(color: Colors.red),
              ),
            );
          }
          if (!snapshot.hasData) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 16),
                  Text("Loading...")
                ],
              ),
            );
          }
          var data = snapshot.data!;
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              Album album = data[index];
              return Card(
                margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: ListTile(
                  leading: Image.network(
                    album.thumbnailUrl,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                        Icon(Icons.broken_image, size: 50),
                  ),
                  title: Text(
                    album.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  subtitle: Text("ID: ${album.id} | Album ID: ${album.albumId}"),
                  onTap: () {
                    // Show full-size image and details when tapped
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text(album.title),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.network(
                              album.url,
                              errorBuilder: (context, error, stackTrace) =>
                                  Icon(Icons.broken_image, size: 100),
                            ),
                            SizedBox(height: 16),
                            Text("Album ID: ${album.albumId}"),
                            Text("Photo ID: ${album.id}"),
                          ],
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: Text("Đóng"),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}