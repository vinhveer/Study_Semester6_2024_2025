import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class Product {
  String productName;
  String productPrice;
  String productCount;

  Product({
    required this.productName,
    required this.productPrice,
    required this.productCount
  });
}

class ProductController extends GetxController {
  final TextEditingController productNameController = TextEditingController();
  final TextEditingController productPriceController = TextEditingController();
  final TextEditingController productCountController = TextEditingController();
  
  final List<Product> products = [];
  
  void addProduct() {
    var product =  Product(
        productName: productNameController.text, 
        productPrice: productPriceController.text, 
        productCount: productCountController.text
    );

    products.add(product);
    update();
  }

  void resetProduct() {
    products.clear();
    update();
  }
}