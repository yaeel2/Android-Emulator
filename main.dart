import 'package:android_sim/screens/homepage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xffaf7373),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Homepage(),
    );
  }
}
