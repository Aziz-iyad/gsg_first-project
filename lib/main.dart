import 'package:flutter/material.dart';
import 'Drawer.dart';
import 'HomeScreen.dart';
import 'animalDetailScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: [
            DrawerScreen(),
            HomeScreen(),
            // AnimalDetailScreen(),
          ],
        ),
      ),
    );
  }
}
