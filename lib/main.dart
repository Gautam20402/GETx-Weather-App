import 'package:flutter/material.dart';
import 'package:weather_app/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: homescreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
