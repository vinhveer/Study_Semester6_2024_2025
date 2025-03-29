import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:thuc_hanh/commercial_app/model/supabase_helper.dart';

class Fruit {
  int id;
  int gia;
  String ten;
  String moTa;
  String anh;

  Fruit({
    required this.id,
    required this.gia,
    required this.ten,
    required this.moTa,
    required this.anh,
  });

  Map<String, dynamic> toMap({
    String Function(String key)? keyMapper,
  }) {
    keyMapper ??= (key) => key;

    return {
      keyMapper('id'): id,
      keyMapper('gia'): gia,
      keyMapper('ten'): ten,
      keyMapper('moTa'): moTa,
      keyMapper('anh'): anh,
    };
  }

  factory Fruit.fromMap(Map<String, dynamic> map, {
    String Function(String key)? keyMapper,
  }) {
    keyMapper ??= (key) => key;

    return Fruit(
      id: map[keyMapper('id')] as int,
      gia: map[keyMapper('gia')] as int,
      ten: map[keyMapper('ten')] as String,
      moTa: map[keyMapper('moTa')] as String,
      anh: map[keyMapper('anh')] as String,
    );
  }
}

class FruitSnapShot {
  static Future<void> update(Fruit newFruit) async{
    final supabase = Supabase.instance.client;
    await supabase
        .from('Fruit')
        .update(newFruit.toMap())
        .eq('id', newFruit.id);
    int id = newFruit.id;
    await deleteImage(bucket: "image", path: "fruit_$id");
  }

  static Future<void> insert(Fruit fruit) async{
    final supabase = Supabase.instance.client;
    await supabase.from('Fruit').insert(fruit.toMap());

  }
  static Future<void> delete(int id) async{
    final supabase = Supabase.instance.client;
    await supabase
        .from('Fruit')
        .delete()
        .eq('id', id);
  }

  static List<Fruit> getAll() {
    return data;
  }

  static Future<Map<int, Fruit>> getFruit() async {
    final supabase = Supabase.instance.client;
    var response = await supabase.from("Fruit").select();

    List<Map<String, dynamic>> fruitData = List<Map<String, dynamic>>.from(response);

    var iterable = fruitData.map((e) => Fruit.fromMap(e));

    Map<int, Fruit> map = { for (var fruit in iterable) fruit.id : fruit };

    return map;
  }

  static Stream<List<Fruit>> getFruitStream() {
    return getDataStream<Fruit>(
      table: "Fruit", ids: ["id"],
      fromJson: (json) => Fruit.fromMap(json)
    );

    // var stream = supabase.from("Fruit").stream(primaryKey: ["id"]);
    // return stream.map((maps) => maps.map(
    //     (e) => Fruit.fromMap(e)
    // ).toList());

    // return supabase
    //     .from("Fruit")
    //     .stream(primaryKey: ["id"])
    //     .map((data) => data.map((item) => Fruit.fromMap(item)).toList());
  }

  static Future<Map<int, Fruit>> getMapFruit() async {
    return getMapData<Fruit>(
      table: "Fruit",
      fromJson: (map) => Fruit.fromMap(map),
      getId: (fruit) => fruit.id,
    );
  }

  static listenChangeFruitData(Map<int, Fruit> maps, {Function()? updateUI}) {
    listenChangeData<Fruit>(
      maps,
      fromMap: (map) => Fruit.fromMap(map),
      getId: (fruit) => fruit.id,
      table: "Fruit",
      updateUI: updateUI,
    );
  }

  static unsubscribeListenFruitChange() {
    final supabase = Supabase.instance.client;
    supabase.channel('public:Fruit').unsubscribe();
  }
}


final data = <Fruit>[
  Fruit(id: 1, ten: "Lê", moTa: "Lê Việt Nam CLC", anh: 'https://citifruit.com/uploads/images/Products/60/Le-Duong-800%C3%97800.jpg', gia: 40000),
  Fruit(id: 2, ten: "Dâu tây", moTa: "Dâu tây Việt Nam CLC", anh: 'https://www.lottemart.vn/media/catalog/product/cache/0x0/8/7/8759635832280-3.jpg.webp',gia: 40000),
  Fruit(id: 3, ten: "Nho", moTa: "Nho Việt Nam CLC", anh: 'https://product.hstatic.net/1000282430/product/nho-xanh-khong-hat_b4fc6f7e53034f548cdd56050e0a6ef1_grande.jpg', gia: 40000),
  Fruit(id: 4, ten: "Xoài", moTa: "Xoài Việt Nam CLC", anh: 'https://kenh14cdn.com/203336854389633024/2024/2/28/photo-1-1709092179912776585807.png', gia: 40000),
  Fruit(id: 5, ten: "Chanh", moTa: "Chanh Việt Nam CLC", anh: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTLgdT7hH6nlEIH_7mw-s8qRB_SP7CgNBQM7A&s', gia: 40000),
  Fruit(id: 6, ten: "Việt Quất", moTa: "Việt Quất Việt Nam CLC", anh: 'https://vitarom.vn/wp-content/uploads/2023/07/Huong-Viet-Quat-Vitarom-2-jpg.webp', gia: 40000),
  Fruit(id: 7, ten: "Sầu riêng", moTa: "Sầu riêng Việt Nam CLC", anh: 'https://vitarom.vn/wp-content/uploads/2022/12/Huong-sau-rieng-Vitarom-jpg.webp', gia: 40000),
  Fruit(id: 8, ten: "Cam", moTa: "Cam Việt Nam CLC", anh: 'https://product.hstatic.net/200000423303/product/cam-vang-uc_830df5311d6342dd93536db918ce52f9_1024x1024.jpg', gia: 40000),
  Fruit(id: 9, ten: "Chuối", moTa: "Chuối Việt Nam CLC", anh: 'https://unifarm.com.vn/wp-content/uploads/2017/04/chu%E1%BB%91i-dole.jpg', gia: 40000),
  Fruit(id: 10, ten: "Bơ", moTa: "Bơ Việt Nam CLC", anh: 'https://danocado.com/datafiles/3/2018-07-18/700-15344491-Trai-Bo-Hass-avocado-hass.jpg', gia: 40000),
];