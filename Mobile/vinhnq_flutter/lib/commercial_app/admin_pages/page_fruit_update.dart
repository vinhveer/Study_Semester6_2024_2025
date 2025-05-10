import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:thuc_hanh/async_widget/dialogs.dart';
import 'package:thuc_hanh/commercial_app/model/model.dart';
import 'package:thuc_hanh/commercial_app/model/supabase_helper.dart';
import 'package:thuc_hanh/helpers/permission_grant.dart';

class PageFruitUpdate extends StatefulWidget {
  PageFruitUpdate({super.key, required this.fruit });
  Fruit fruit;

  @override
  State<PageFruitUpdate> createState() => _PageFruitUpdateState();
}

class _PageFruitUpdateState extends State<PageFruitUpdate> {
  TextEditingController txtId = TextEditingController();
  TextEditingController txtTen = TextEditingController();
  TextEditingController txtGia = TextEditingController();
  TextEditingController txtMoTa = TextEditingController();
  XFile? _xFile;
  String? imageUrl;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Update Fruit"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              SizedBox(
                height: 300,
                child: _xFile == null ? Image.network(widget.fruit.anh) : Image.file(File(_xFile!.path), fit: BoxFit.cover,),
              ),
              SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                      onPressed: () async {
                        // if (await requestPermission(Permission.photos)) {
                          ImagePicker imagePicker = ImagePicker();
                          var image = await imagePicker.pickImage(source: ImageSource.gallery);

                          if (image != null) {
                            setState(() {
                              _xFile = image;
                            });
                          }
                        // } else {
                        //   showConfirmDialog(context, "Bạn cần cấp quyền truy cập ảnh");
                        // }
                      },
                      child: Text("Chọn ảnh")
                  )
                ],
              ),
              SizedBox(height: 30,),
              TextField(
                readOnly: true,
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
                        Fruit fruit = widget.fruit;
                        showSnackBar(context, message: "Đang cập nhật");

                        if (_xFile != null) {
                          imageUrl = await updateImage(
                              image: File(_xFile!.path),
                              bucket: "images",
                              path: "fruits/fruit_${txtId.text}.jpg"
                          );
                          fruit.anh = imageUrl!;
                        }

                        fruit.ten = txtTen.text;
                        fruit.gia = int.parse(txtGia.text);
                        fruit.moTa = txtMoTa.text;

                        try {
                          await FruitSnapShot.update(fruit);
                        } catch (e) {
                          showSnackBar(context, message: "Cập nhật thất bại");
                        }
                        
                        showSnackBar(context, message: "Cập nhật thành công");
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

  @override
  void initState() {
    super.initState();

    txtId.text = widget.fruit.id.toString();
    txtTen.text = widget.fruit.ten;
    txtGia.text = widget.fruit.gia.toString();
    txtMoTa.text = widget.fruit.moTa ?? "";
  }
}
