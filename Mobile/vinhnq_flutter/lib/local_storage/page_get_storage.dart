import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class PageGetStorage extends StatefulWidget {
  const PageGetStorage({super.key});

  @override
  State<PageGetStorage> createState() => _PageGetStorageState();
}

class _PageGetStorageState extends State<PageGetStorage> {
  late GetStorage box;
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Get Storage"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("$count", style: TextStyle(fontSize: 30),),
            ElevatedButton(
                onPressed: () {
                  box.write("counter", ++count);
                  // setState(() {
                  //   count = box.read("counter") ?? 0;
                  // });
                },
                child: Text("Tăng")
            )
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _initGetStorage();
  }

  _initGetStorage() async {
    await GetStorage.init();
    box = GetStorage();
    setState(() {
      count = box.read("counter") ?? 0;
    });

    box.listenKey("counter", (value) {
      setState(() {
        count = value;
      });
    },);
  }
}
