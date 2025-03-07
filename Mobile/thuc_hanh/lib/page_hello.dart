import 'package:flutter/material.dart';

class PageHello extends StatelessWidget {
  const PageHello({super.key});

  @override
  Widget build(BuildContext context) {
    return MyHomePage(title: "Hello, world!");
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String message = "Duyên";
  TextEditingController txtName = TextEditingController();
  TextEditingController txtNgaySinh = TextEditingController();
  String imageURL = "https://d1hjkbq40fs2x4.cloudfront.net/2016-01-31/files/1045.jpg";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Example"),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Center(child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 300, width: 400,
                  child: Image.network(imageURL),
                ),
                Text("Hello, world!", style: TextStyle(fontSize: 20),),
                Text("Chào $message"),
                TextField(
                  controller: txtName,
                  decoration: InputDecoration(
                      labelText: "Tên",
                      hintText: "Nhập tên vào đây"
                  ),
                ),
                TextField(
                  controller: txtNgaySinh,
                  decoration: InputDecoration(
                      labelText: "Ngày sinh",
                      hintText: "Nhập ngày sinh vào đây"
                  ),
                  keyboardType: TextInputType.datetime,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (message == "Duyên")
                      message = "Thuỷ";
                    else
                      message = "Duyên";

                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Column(
                          children: [
                            Text("Chào ${txtName.text}"),
                            Text("Chúc mừng sinh nhật bạn: ${txtNgaySinh.text}")
                          ],
                        ))
                    );
                    setState(() {});
                  },
                  child: Text("Click me!"),

                ),
                Row (
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 100,
                        color: Colors.lightBlue,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        height: 100,
                        color: Colors.orange,
                      ),
                    )
                  ],
                )
              ],
            )),
          ),
        )
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    txtName.text = "CC";
    txtNgaySinh.text = "8/3/2004";
  }
}

