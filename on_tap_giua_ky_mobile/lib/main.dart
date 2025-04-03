import 'package:flutter/material.dart';
import 'package:on_tap_giua_ky_mobile/converter/converter.dart';
import 'package:on_tap_giua_ky_mobile/product/page_product.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
      ),
      home: Converter(),
    );
  }
}