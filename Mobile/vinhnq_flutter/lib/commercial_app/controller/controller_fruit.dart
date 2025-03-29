// import 'package:get/get.dart';
// import 'package:thuc_hanh/commercial_app/models/models.dart';
//
// class ControllerFruit extends GetxController {
//   var _maps = <int, Fruit>{};
//   var gioHang = <GioHangItem>[];
//
//   int get soLuongMatHang => gioHang.length;
//   static ControllerFruit get() => Get.find();
//   Iterable<Fruit> get fruits => _maps.values;
//
//   @override
//   void onReady() async {
//     // TODO: implement onReady
//     super.onReady();
//     // fruits = FruitSnapShot.getAll();
//
//     _maps = await FruitSnapShot.getFruit();
//
//     if (_maps.isNotEmpty) {
//       Get.log("✅ Tải dữ liệu thành công: ${_maps.length} sản phẩm");
//       _maps.forEach((key, fruit) {
//         Get.log("🍎 ID: $key - Tên: ${fruit.ten} - Giá: ${fruit.gia}");
//       });
//     } else {
//       Get.log("⚠️ Không có dữ liệu trái cây!");
//     }
//
//     update(["fruits"]);
//   }
//
//   themMatHangVaoGioHang(Fruit fruitItem) {
//     for (var item in gioHang) {
//       if (item.fruit.id == fruitItem) {
//         item.soLuong++;
//         return;
//       }
//     }
//     gioHang.add(GioHangItem(fruit: fruitItem, soLuong: 1));
//     update(['gh']);
//   }
// }
//
// class BindingsAppFruitStore extends Bindings {
//
//   @override
//   void dependencies() {
//     Get.lazyPut(() => ControllerFruit(),);
//   }
// }
//
// class GioHangItem {
//   Fruit fruit;
//   int soLuong;
//
//   GioHangItem({
//     required this.fruit,
//     required this.soLuong,
//   });
// }