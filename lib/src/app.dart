import 'package:flutter/material.dart';
import 'package:practicum/screens/home.dart';

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Practicum',
      theme:
          ThemeData(primarySwatch: Colors.purple, brightness: Brightness.dark),
      home: HomeScreen(),
    );
  }
}
