import 'package:flutter/material.dart';
import 'package:thuc_hanh/commercial_app/model/model.dart';

class PageFruitStream extends StatelessWidget {
  const PageFruitStream({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fruit Store"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: StreamBuilder<List<Fruit>>(
          stream: FruitSnapShot.getFruitStream(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              print(snapshot.error.toString());
              return Center(child: Text("Has error"),);
            }

            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator(),);
            }

            var list = snapshot.data!;
            return ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) {
                Fruit fruit = list[index];
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: ListTile(
                    leading: Image.network(
                      fruit.anh,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) =>
                          Icon(Icons.broken_image, size: 50),
                    ),
                    title: Text(
                      fruit.ten,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    subtitle: Text("ID: ${fruit.id} | Giá: ${fruit.gia} VND"),
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text(fruit.ten),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.network(
                                fruit.anh,
                                errorBuilder: (context, error, stackTrace) =>
                                    Icon(Icons.broken_image, size: 100),
                              ),
                              SizedBox(height: 16),
                              Text("Giá: ${fruit.gia} VND"),
                              Text("Mô tả: ${fruit.moTa}"),
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
          }
      ),
    );
  }
}
