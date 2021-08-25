import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_color_pallete/model/catalog.dart';
import 'package:provider/provider.dart';
import 'package:localstore/localstore.dart';

class FavoriteModel extends ChangeNotifier {
  final db = Localstore.instance;
  final List<ItemColor> favoriteColors = [];

  FavoriteModel() {
    print("favorite model constructor");
    loadFavorite();
  }

  Future loadFavorite() async {
    final loadedColors = await db.collection('favorites').get();
    
    if (loadedColors != null) {
      loadedColors.forEach((key, value) {
        final code = value.toString().split(":")[1].replaceAll("}", "");
        final name = key.replaceAll("/favorites/", "");
        final colorValue = Color(int.parse(code));
        final ItemColor color = new ItemColor(colorValue, name);
        favoriteColors.add(color);
      });
    }
    notifyListeners();
  }

  bool isFavorite(ItemColor color) {
    return favoriteColors.any((element) => element.name == color.name);
  }

  void add(ItemColor color) {
    favoriteColors.add(color);
    db
        .collection('favorites')
        .doc(color.name)
        .set({"color": color.color.value.toString()});
    notifyListeners();
  }

  void remove(ItemColor color) {
    favoriteColors.remove(color);
    notifyListeners();
  }
}
