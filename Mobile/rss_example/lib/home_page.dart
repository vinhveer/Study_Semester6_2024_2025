import 'package:flutter/material.dart';
import 'package:rss_example/page_rss.dart';
import 'package:rss_example/settings.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    PageRss(),
    PageSettings(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_currentIndex == 0 ? "Tin tức" : "Cài đặt nguồn tin"),
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.article),
            label: 'Tin tức',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Nguồn tin',
          ),
        ],
      ),
    );
  }
}
