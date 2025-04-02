import 'package:flutter/material.dart';
import 'package:on_tap_giua_ky_mobile/page_converter.dart';
import 'package:on_tap_giua_ky_mobile/page_student.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: PageStudent(),
    );
  }
}