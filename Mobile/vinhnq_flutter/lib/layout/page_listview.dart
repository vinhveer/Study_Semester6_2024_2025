import 'package:flutter/material.dart';

class PageListview extends StatelessWidget {
  const PageListview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My List View"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView.separated(
          itemBuilder: (context, index) {
            SanPham s = data[index];
            return ListTile(
              leading: Text("${index + 1}.", style: TextStyle(fontSize: 16),),
              title: Text(s.ten),
              trailing: Text("${s.gia} VND", style: TextStyle(color: Colors.red),),
              subtitle: Text("Trái cây", style: TextStyle(fontStyle: FontStyle.italic),),
              onTap: () {
                ScaffoldMessenger.of(context).clearSnackBars();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                      content: Text("Bạn chọn ${s.ten}"),
                      duration: Duration(seconds: 5),
                  )
                );
              },
            );
          },
          separatorBuilder: (context, index) => Divider(thickness: 1.5,),
          itemCount: data.length)
    );
  }
}

class SanPham {
  String ten;
  int gia;

  SanPham({
    required this.ten,
    required this.gia,
  });
}

var data = [
  SanPham(ten: "Bưởi", gia: 35000),
  SanPham(ten: "Đào", gia: 40000),
  SanPham(ten: "Măng cụt", gia: 35000),
  SanPham(ten: "Lê", gia: 40000),
  SanPham(ten: "Thị", gia: 35000),
  SanPham(ten: "Hồng", gia: 40000),
  SanPham(ten: "Me", gia: 35000),
  SanPham(ten: "Sơ ri", gia: 40000),
  SanPham(ten: "Chanh", gia: 35000),
  SanPham(ten: "Xoài", gia: 40000),
  SanPham(ten: "Táo", gia: 35000),
  SanPham(ten: "Đu đủ", gia: 40000),
  SanPham(ten: "Dừa", gia: 35000),
  SanPham(ten: "Cam", gia: 40000),
  SanPham(ten: "Chuối", gia: 35000)
];