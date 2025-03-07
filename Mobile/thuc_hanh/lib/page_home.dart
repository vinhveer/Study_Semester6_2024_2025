import 'package:flutter/material.dart';
import 'package:thuc_hanh/app_state/getx/getx_counter.dart';
import 'package:thuc_hanh/app_state/getx/getx_myapp.dart';
import 'package:thuc_hanh/app_state/getx/getx_simple_state.dart';
import 'package:thuc_hanh/layout/page_gridview.dart';
import 'package:thuc_hanh/layout/page_listview.dart';
import 'package:thuc_hanh/page_hello.dart';
import 'package:thuc_hanh/profile/page_profile.dart';

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
          buildListItem(context, title: "Hồ sơ của tôi", destination: MyProfile()),
          buildListItem(context, title: "Hello, world!", destination: PageHello()),
          buildListItem(context, title: "Danh sách trái cây (List Views)", destination: PageListview()),
          buildListItem(context, title: "Danh sách trái cây (Grid Views)", destination: PageGridview()),
          buildListItem(context, title: "GetX Counter Example", destination: PageCounterGetX()),
          buildListItem(context, title: "GetX Simple Counter", destination: PageCounterSimple()),
          buildListItem(context, title: "GetX My App", destination: GetxMyApp())
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