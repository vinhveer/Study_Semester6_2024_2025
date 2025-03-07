import 'package:flutter/material.dart';
import 'package:thuc_hanh/layout/page_chi_tiet.dart';
import 'package:thuc_hanh/layout/page_listview.dart';

class PageGridview extends StatefulWidget {
  const PageGridview({super.key});

  @override
  State<PageGridview> createState() => _PageGridviewState();
}

class _PageGridviewState extends State<PageGridview> {
  @override
  Widget build(BuildContext context) {
    String image = "https://cdn.tgdd.vn/2021/11/CookDishThumb/bat-mi-cach-chon-me-ngon-va-cach-bao-quan-me-chin-duoc-lau-thumb-620x620.jpg";
    int count = 0;

    return Scaffold(
        appBar: AppBar(
          title: Text("My Grid View"),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          actions: [
            Stack(
              children: [
                Icon(Icons.shopping_cart, color: Colors.red, size: 40),
                Padding(padding: const EdgeInsets.only(left: 14, top: 1),
                child: Text("${count}", style: TextStyle(color: Colors.white)),)
              ],
            ),
          ],
        ),
        body: GridView.extent(
            childAspectRatio: 0.8,
            maxCrossAxisExtent: 300,
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
            children: data.map(
                (e) {
                  return GestureDetector(
                    child: Card(
                      child: Column(
                        children: [
                          Expanded(
                            child: Container(
                              child: Image.network(image),
                            ),
                          ),
                          Text(e.ten),
                          Text("${e.gia}")
                        ],
                      ),
                    ),
                    onTap: () async {
                      // setState(() {
                      //   count++;
                      // });

                      String message = await Navigator.of(context).push(MaterialPageRoute(builder: (context) => PageChiTiet()));
                      
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
                    },
                  );
                },
            ).toList(),
        ),
    );
  }
}
