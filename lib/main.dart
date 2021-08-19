import 'package:flutter/material.dart';
import 'package:flutter_color_pallete/model/catalog.dart';
import 'package:flutter_color_pallete/screens/catalog.dart';
import 'package:flutter_color_pallete/screens/login.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider(create: (context) => CatalogModel()),
        ],
        child: MaterialApp(
            title: 'Color Pallete',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            initialRoute: "/",
            routes: {
              "/": (context) => Login(),
              "/catalog": (context) => Catalog(),
            })
    );
  }
}
