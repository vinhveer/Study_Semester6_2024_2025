import 'package:flutter/material.dart';
import 'package:thuc_hanh/app_state/getx_lecture_2/app_getx.dart';
import 'package:thuc_hanh/app_state/getx/getx_myapp.dart';
import 'package:thuc_hanh/app_state/getx/getx_simple_state.dart';
import 'package:thuc_hanh/commercial_app/admin_pages/page_fruit_admin.dart';
import 'package:thuc_hanh/commercial_app/app_fruit_store.dart';
import 'package:thuc_hanh/commercial_app/page_auth_user.dart';
import 'package:thuc_hanh/json/page_albums.dart';
import 'package:thuc_hanh/layout/page_gridview.dart';
import 'package:thuc_hanh/layout/page_listview.dart';
import 'package:thuc_hanh/local_storage/page_get_storage.dart';
import 'package:thuc_hanh/page_hello.dart';
import 'package:thuc_hanh/permisssion/test_grant_permission.dart';
import 'package:thuc_hanh/profile/page_profile.dart';
import 'package:thuc_hanh/rss/pages/page_rss.dart';

class PageHome extends StatelessWidget {
  const PageHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ứng dụng của tôi", style: TextStyle(fontWeight: FontWeight.w500),),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        leading: Icon(Icons.apps), // Added icon to AppBar
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          buildListItem(context, title: "Login", destination: PageAuthUser()),
          buildListItem(context, title: "Get Storage", destination: PageGetStorage()),
          buildListItem(context, title: "Quyền", destination: PageGrantPermission()),
          buildListItem(context, title: "Hồ sơ của tôi", destination: MyProfile()),
          buildListItem(context, title: "Hello, world!", destination: PageHello()),
          buildListItem(context, title: "Danh sách trái cây (List Views)", destination: PageListview()),
          buildListItem(context, title: "Danh sách trái cây (Grid Views)", destination: PageGridview()),
          buildListItem(context, title: "GetX Simple Counter", destination: PageCounterSimple()),
          buildListItem(context, title: "GetX My App", destination: GetxMyApp()),
          buildListItem(context, title: "GetX App", destination: AppGetX()),
          buildListItem(context, title: "Page Albums", destination: PageAlbums()),
          buildListItem(context, title: "Fruit App E-Com", destination: AppFruitStore()),
          buildListItem(context, title: "Fruit App E-Com Admin", destination: PageFruitAdmin()),
          buildListItem(context, title: "RSS", destination: PageRss())
        ],
      ),
    );
  }

  Widget buildListItem(BuildContext context, {required String title, required Widget destination}) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        title: Text(title),
        trailing: Icon(Icons.arrow_forward_ios),
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => destination,
          ));
        },
      ),
    );
  }
}