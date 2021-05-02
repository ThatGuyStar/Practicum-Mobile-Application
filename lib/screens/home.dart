import 'package:flutter/material.dart';
import 'package:practicum/screens/preview.dart';
import 'package:practicum/screens/search.dart';

import 'information.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> screens = [Preview(), SearchEmojiScreen(), DeviceInfoScreen()];
  int selectedTab = 0;

  void _handleTap(int index) {
    setState(() {
      selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Emoji Viewer')),
        elevation: 0.0,
      ),
      body: screens[selectedTab],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.preview), label: 'Preview'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: 'Information')
        ],
        currentIndex: selectedTab,
        onTap: _handleTap,
        selectedItemColor: Colors.purple,
        backgroundColor: Colors.grey[900],
      ),
    );
  }
}
