import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:thuc_hanh/page_home.dart';

void main() async {
  await Supabase.initialize(
    url: 'https://ahiymdsyusskhrbasqba.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImFoaXltZHN5dXNza2hyYmFzcWJhIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDE5OTg3MjMsImV4cCI6MjA1NzU3NDcyM30.UxMANE_thxo753DRVaq2sHw5PltzhDqvtFuftuw06_E',
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.transparent),
      ),
      home: const PageHome(),
    );
  }
}

