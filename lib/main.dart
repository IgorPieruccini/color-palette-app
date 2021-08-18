import 'package:flutter/material.dart';
import 'package:flutter_color_pallete/screens/catalog.dart';
import 'package:flutter_color_pallete/screens/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Color Pallete',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => Login(),
        "/catalog": (context) => Catalog(),
      }
    );
  }
}