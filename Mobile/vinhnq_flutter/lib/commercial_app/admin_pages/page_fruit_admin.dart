import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:thuc_hanh/async_widget/async_widget.dart';
import 'package:thuc_hanh/async_widget/dialogs.dart';
import 'package:thuc_hanh/commercial_app/admin_pages/page_fruit_add.dart';
import 'package:thuc_hanh/commercial_app/admin_pages/page_fruit_update.dart';
import 'package:thuc_hanh/commercial_app/model/model.dart';

class PageFruitAdmin extends StatelessWidget {
  PageFruitAdmin({super.key});
  late BuildContext myContext;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fruits Admin"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => PageFruitAdd()));
              },
              icon: Icon(Icons.add_circle, size: 30,)
          ),
        ],
      ),
      body: StreamBuilder<List<Fruit>>(
          stream: FruitSnapShot.getFruitStream(),
          builder: (context, snapshot) {
            return AsyncWidget(
                snapshot: snapshot,
                builder: (context, snapshot) {
                  var list = snapshot.data! as List<Fruit>;
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ListView.separated(
                        itemBuilder: (context, index) {
                          myContext = context;
                          Fruit fruit = list[index];
                          return Slidable(
                            // Specify a key if the Slidable is dismissible.
                            key: const ValueKey(0),
                            // The end action pane is the one at the right or the bottom side.
                            endActionPane: ActionPane(
                              extentRatio: 0.6,
                              motion: const ScrollMotion(),
                              children: [
                                SlidableAction(
                                  // An action can be bigger than the others.
                                  flex: 2,
                                  onPressed: (context) {
                                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => PageFruitUpdate(fruit: fruit,)));
                                  },
                                  backgroundColor: Colors.lightBlue,
                                  foregroundColor: Colors.white,
                                  icon: Icons.edit,
                                  label: 'Chỉnh sửa',
                                ),
                                SlidableAction(
                                  onPressed: (context) async {
                                    var result = await showConfirmDialog(myContext, "Bạn có muốn xóa sản phẩm này không?");
                                    if (result == "ok") {
                                      await FruitSnapShot.delete(fruit.id);
                                      ScaffoldMessenger.of(myContext).clearSnackBars();
                                      ScaffoldMessenger.of(myContext).showSnackBar(SnackBar(content: Text("Đã xoá sản phẩm")));
                                    }
                                  },
                                  backgroundColor: Colors.redAccent,
                                  foregroundColor: Colors.white,
                                  icon: Icons.delete,
                                  label: 'Xoá',
                                ),
                              ],
                            ),

                            child: ListTile(
                                leading: Text(fruit.id.toString()),
                                trailing: Image.network(fruit.anh, width: 100, height: 100, fit: BoxFit.cover,),
                                title: Text(fruit.ten),
                                subtitle: Text("${fruit.gia} VND \n${fruit.moTa}"),
                                onTap: () {
                                  showConfirmDialog(context, "Bạn có muốn xóa sản phẩm này không?");
                                }
                            ),
                          );
                        },
                        separatorBuilder: (context, index) => Divider(thickness: 1.5,),
                        itemCount: list.length
                    ),
                  );
                },
            );
          },
      )
    );
  }


}
