import 'package:flutter/material.dart';
import 'package:shopping/views/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor:
              Colors.blue.shade800, // Dark blue background for AppBar
          iconTheme: const IconThemeData(
              color: Colors.white), // White color for AppBar icons
        ),
      ),
      home: const HomePage(),
    );
  }
}
