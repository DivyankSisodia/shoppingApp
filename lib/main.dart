import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping/views/home_page.dart';
import 'package:shopping/views/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            backgroundColor:
                Colors.blue.shade800, // Dark blue background for AppBar
            iconTheme: const IconThemeData(
                color: Colors.white), // White color for AppBar icons
          ),
        ),
        home: const SplashScreenPage(),
      ),
    );
  }
}
