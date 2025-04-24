import 'package:flutter/material.dart';

class ReadContact extends StatefulWidget {
  const ReadContact({super.key});

  @override
  State<ReadContact> createState() => _ReadContactState();
}

class _ReadContactState extends State<ReadContact> {




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contact"),
      ),
      body: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              ElevatedButton(
                  onPressed: () {

                  },
                  child: Text("Đọc danh bạ")
              )
            ],
          ),
      ),
    );
  }
}
