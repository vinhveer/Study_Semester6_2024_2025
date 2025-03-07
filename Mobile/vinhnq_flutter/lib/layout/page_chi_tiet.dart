import 'package:flutter/material.dart';

class PageChiTiet extends StatelessWidget {
  const PageChiTiet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chi tiết"),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop("Bye bye");
            },
            child: Text("Go back")
        ),
      ),
    );
  }
}
