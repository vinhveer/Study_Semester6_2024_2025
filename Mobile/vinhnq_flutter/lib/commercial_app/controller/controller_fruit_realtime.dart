import 'package:get/get.dart';
import 'package:thuc_hanh/commercial_app/model/model.dart';

class ControllerFruit extends GetxController {
  var _maps = <int, Fruit>{};
  var gioHang = <GioHangItem>[];

  static ControllerFruit get() => Get.find();
  int get soLuongMatHang => gioHang.length;
  Iterable<Fruit> get fruits => _maps.values;

  @override
  void onReady() async {
    // TODO: implement onReady
    super.onReady();
    // fruits = FruitSnapShot.getAll();

    _maps = await FruitSnapShot.getFruit();

    update(["fruits"]);
    FruitSnapShot.listenChangeFruitData(_maps, updateUI: () => update(["fruits"]));
  }

  themMatHangVaoGioHang(Fruit fruitItem) {
    for (var item in gioHang) {
      if (item.fruit.id == fruitItem) {
        item.soLuong++;
        return;
      }
    }
    gioHang.add(GioHangItem(fruit: fruitItem, soLuong: 1));
    update(['gh']);
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    FruitSnapShot.unsubscribeListenFruitChange();
  }
}

class BindingsAppFruitStore extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => ControllerFruit(),);
  }
}

class GioHangItem {
  Fruit fruit;
  int soLuong;

  GioHangItem({
    required this.fruit,
    required this.soLuong,
  });
}