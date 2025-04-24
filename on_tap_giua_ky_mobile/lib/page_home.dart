import 'package:flutter/material.dart';
import 'package:on_tap_giua_ky_mobile/converter/converter.dart';
import 'package:on_tap_giua_ky_mobile/converter_set_state/page_converter.dart';
import 'package:on_tap_giua_ky_mobile/product/page_product.dart';
import 'package:on_tap_giua_ky_mobile/student/page_student.dart';

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
          buildListItem(context, title: "Quản lý học sinh", destination: PageStudent()),
          buildListItem(context, title: "Quản lý mặt hàng", destination: PageProduct()),
          buildListItem(context, title: "Chuyển đổi đơn vị (Ngang)", destination: PageConverter()),
          buildListItem(context, title: "Chuyển đổi đơn vị (Dọc)", destination: Converter()),
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
          Navigator.of(context).push(PageRouteBuilder(
            transitionDuration: Duration(milliseconds: 300), // Thời gian hiệu ứng
            pageBuilder: (context, animation, secondaryAnimation) => destination,
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              var begin = Offset(1.0, 0.0); // Bắt đầu từ bên phải
              var end = Offset.zero; // Kết thúc ở giữa
              var curve = Curves.easeInOut; // Hiệu ứng cong

              var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
              var offsetAnimation = animation.drive(tween);

              return SlideTransition(position: offsetAnimation, child: child);
            },
          ));
        },
      ),
    );
  }
}