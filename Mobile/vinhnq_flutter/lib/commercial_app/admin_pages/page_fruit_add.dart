import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:thuc_hanh/commercial_app/model/model.dart';
import 'package:thuc_hanh/commercial_app/model/supabase_helper.dart';
import 'package:thuc_hanh/helpers/permission_grant.dart';

class PageFruitAdd extends StatefulWidget {
  const PageFruitAdd({super.key});

  @override
  State<PageFruitAdd> createState() => _PageFruitAddState();
}

class _PageFruitAddState extends State<PageFruitAdd> {
  TextEditingController txtId = TextEditingController();
  TextEditingController txtTen = TextEditingController();
  TextEditingController txtGia = TextEditingController();
  TextEditingController txtMoTa = TextEditingController();
  XFile? _xFile;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Fruit"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              Container(
                height: 300,
                child: _xFile == null ? Icon(Icons.image) : Image.file(File(_xFile!.path), fit: BoxFit.cover,),
              ),
              SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                      onPressed: () async {
                        if (await requestPermission(Permission.photos)) {
                          ImagePicker imagePicker = ImagePicker();
                          var image = await imagePicker.pickImage(source: ImageSource.gallery);

                          if (image != null) {
                            setState(() {
                              _xFile = image;
                            });
                          }
                        }
                      },
                      child: Text("Chọn ảnh")
                  )
                ],
              ),
              SizedBox(height: 30,),
              TextField(
                controller: txtId,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "ID"
                ),
                keyboardType: TextInputType.numberWithOptions(
                  decimal: false, signed: false
                ),
              ),
              SizedBox(height: 10,),
              TextField(
                controller: txtTen,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Tên sản phẩm"
                ),
              ),
              SizedBox(height: 10,),
              TextField(
                controller: txtGia,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Giá"
                ),
                keyboardType: TextInputType.numberWithOptions(
                    decimal: false, signed: false
                ),
              ),
              SizedBox(height: 10,),
              TextField(
                controller: txtMoTa,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Mô tả"
                ),
              ),
              SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                      onPressed: () async {
                        if (txtId.text.isEmpty) {
                          ScaffoldMessenger.of(context).clearSnackBars();
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Vui lòng tải ảnh lên")));
                        } else {
                          ScaffoldMessenger.of(context).clearSnackBars();
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  content: Text("Đang thêm sản phẩm ${txtTen.text}"),
                                  duration: Duration(seconds: 10),
                              ),
                          );

                          var url = await uploadImage(
                              image: File(_xFile!.path),
                              bucket: "images",
                              path: "fruits/fruit_${txtId.text}.jpg"
                          );

                          Fruit fruit = Fruit(
                            id: int.parse(txtId.text),
                            ten: txtTen.text,
                            gia: int.parse(txtGia.text),
                            moTa: txtMoTa.text,
                            anh: url,
                          );

                          await FruitSnapShot.insert(fruit);
                          ScaffoldMessenger.of(context).clearSnackBars();
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Đã thêm thành công")));
                        }
                      },
                      child: Text("Lưu thông tin")
                  )
                ],
              ),
            ]
          ),  
        ),
      )
    );
  }
}
