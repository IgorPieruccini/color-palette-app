import 'package:flutter/material.dart';
import 'package:flutter_color_pallete/model/catalog.dart';

import 'package:provider/provider.dart';

class FavoriteModel extends ChangeNotifier {
  final List<ItemColor> favoriteColors = [];

  bool isFavorite(ItemColor color) {
    return favoriteColors.any((element) => element.name == color.name);
  }

  void add(ItemColor color) {
    favoriteColors.add(color);
    notifyListeners();
  }

  void remove(ItemColor color) {
    favoriteColors.remove(color);
    notifyListeners();
  }
}
