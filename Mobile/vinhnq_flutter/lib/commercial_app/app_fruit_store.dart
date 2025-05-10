import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:badges/badges.dart' as badges;
import 'package:thuc_hanh/commercial_app/page_auth_user.dart';
import 'package:thuc_hanh/commercial_app/page_chi_tiet.dart';
import 'controller/controller_fruit_realtime.dart';
import 'model/supabase_helper.dart';

class AppFruitStore extends StatelessWidget {
  const AppFruitStore({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Fruit Store",
      initialBinding: BindingsAppFruitStore(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
      ),
      home: const PageHomeFruitStore(),
    );
  }
}

class PageHomeFruitStore extends StatelessWidget {
  const PageHomeFruitStore({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fruit Store"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          GetBuilder(
            id: 'gh',
            init: ControllerFruit.get(),
            builder:
                (controller) => badges.Badge(
                  showBadge: controller.soLuongMatHang > 0,
                  badgeContent: Text(
                    '${controller.soLuongMatHang}',
                    style: TextStyle(color: Colors.white),
                  ),
                  child: Icon(Icons.shopping_cart),
                ),
          ),
          SizedBox(width: 20), // Đã sửa height thành width
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            GetBuilder<ControllerFruit>(
                id: "drawer_header",
                init: ControllerFruit.get(),
                builder: (controller) => UserAccountsDrawerHeader(
                    accountName: Text("Welcome back!"),
                    accountEmail: Text("${reponse?.user?.email ?? "Chưa đăng nhập"}")
                ),
            ),
            Column(
              children: [
                IconButton(
                    onPressed: () async {
                      await supabase.auth.signOut();
                      reponse = null;
                      ControllerFruit.get().auth();
                    },
                    icon: Icon(Icons.logout)
                )
              ],
            )
          ],
        ),
      ),
      body: GetBuilder<ControllerFruit>(
        id: "fruits",
        init: ControllerFruit.get(),
        builder: (controller) {
          var fruits = controller.fruits;
          return GridView.extent(
            maxCrossAxisExtent: 300,
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
            childAspectRatio: 0.75,
            children:
                fruits.map(
                      (e) => GestureDetector(
                        onTap: () {
                          Get.to(PageChiTietFruit(fruit: e));
                        },
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(12),
                                    ),
                                    child: SizedBox(
                                      height: 160,
                                      width: double.infinity,
                                      child: Image.network(
                                        e.anh,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(12),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          e.ten,
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        SizedBox(height: 4),
                                        Text(
                                          "${e.gia} VND",
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.green.shade700,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                    .toList(),
          );
        },
      ),
    );
  }
}
