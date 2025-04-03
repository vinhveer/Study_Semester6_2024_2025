import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:on_tap_giua_ky_mobile/product/product_controller.dart';

class PageProduct extends StatefulWidget {
  const PageProduct({super.key});

  @override
  State<PageProduct> createState() => _PageProductState();
}

class _PageProductState extends State<PageProduct> {
  final productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quản lý sản phẩm"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              SizedBox(
                  height: 380,
                  child: GetBuilder<ProductController>(
                      init: productController,
                      builder: (controller) => ListView.separated(
                          itemBuilder: (context, index) => ListTile(
                            title: Text(controller.products[index].productName),
                            leading: Text("${index + 1}"),
                            trailing: Text("Số lượng: ${controller.products[index].productCount}"),
                            subtitle: Text("Đơn giá: ${controller.products[index].productPrice}"),
                          ),
                          separatorBuilder: (context, index) => Divider(),
                          itemCount: controller.products.length
                      ),
                  )
              ),
              SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Divider(color: Colors.black, thickness: 1.5,),
                    GetBuilder<ProductController>(builder: (controller) => Text("Danh sách có ${controller.products.length} sản phẩm", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),),),
                    Divider(color: Colors.black, thickness: 1.5,),
                    SizedBox(height: 10,),
                    Text("Tên mặt hàng"),
                    TextField(
                      controller: productController.productNameController,
                    ),
                    SizedBox(height: 20,),
                    Text("Đơn giá"),
                    TextField(
                      controller: productController.productPriceController,
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(height: 20,),
                    Text("Số lượng"),
                    TextField(
                      controller: productController.productCountController,
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              productController.resetProduct();
                            },
                            child: Icon(Icons.restore_from_trash),
                        ),
                        SizedBox(width: 10,),
                        ElevatedButton(
                            onPressed: () {
                              productController.addProduct();
                            },
                            child: Text("Thêm sản phẩm mới")
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 30,)
            ],
          ),
        ),
      ),
    );
  }
}
