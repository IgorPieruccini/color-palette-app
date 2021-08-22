import 'package:flutter/material.dart';
import 'dart:math';

class ItemColor {
  final Color color;
  final String name;
  ItemColor(this.color, this.name);

  @override
  String get getName => this.name;
  @override
  Color get getColor => this.color;
}

class CatalogModel {
  static final max = 255;

  ItemColor randomColor (int index) {
    final red = new Random(index).nextInt(max);
    final blue = new Random(index + red).nextInt(max);
    final green = new Random(index + blue).nextInt(max);
    final Color color = Color.fromARGB(max, red, blue, green);
    final name =
        color.toString().split(RegExp(r"(\(|\))"))[1].replaceAll("0x", "#");
    index = index + 1;
    return new ItemColor(color, name);
  }

  String getColorHey() {
    return "";
  }
}
