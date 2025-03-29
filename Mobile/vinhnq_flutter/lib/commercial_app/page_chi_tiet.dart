import 'dart:math';

import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:thuc_hanh/commercial_app/model/model.dart';
import 'controller/controller_fruit_realtime.dart';


class PageChiTietFruit extends StatelessWidget {
  PageChiTietFruit({super.key, required this.fruit});
  final Fruit fruit;
  final double rating = getRating();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(fruit.ten),
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
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Image.network(fruit.anh, fit: BoxFit.fitWidth,),
            ),
            SizedBox(height: 10,),
            Text(fruit.ten, style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),),
            SizedBox(height: 10,),
            Row(
              children: [
                Text("${fruit.gia} VND", style: TextStyle(fontSize: 25),),
                SizedBox(width: 20,),
                Text("${fruit.gia * 1.2} VND", style: TextStyle(decoration: TextDecoration.lineThrough, ),)
              ],
            ),
            SizedBox(width: 10,),
            Text(fruit.moTa),
            SizedBox(height: 10,),
            Row (
              children: [
                RatingBarIndicator(
                  rating: rating,
                  itemBuilder: (context, index) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  itemCount: 5,
                  itemSize: 30,
                  direction: Axis.horizontal,
                ),
                SizedBox(height: 10,),
                Text("$rating", style: TextStyle(color: Colors.red,)),
                SizedBox(width: 20,),
                Expanded(child: Text("${Random().nextInt(1000)} đánh giá"))
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            ControllerFruit.get().themMatHangVaoGioHang(fruit);
          },
          child: Icon(Icons.add_shopping_cart),
      ),
    );
  }
}

double getRating() {
  return Random().nextInt(201) / 100 + 3;
}