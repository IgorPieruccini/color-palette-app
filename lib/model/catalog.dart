import 'package:flutter/material.dart';

class CatalogModel {

  @override
  String get generateRandomColor => "this will be a color";
}

@immutable
class ItemColor {
  final int hash;
  final String name;

  ItemColor(this.hash, this.name);

  @override
  int get colorHash => hash;

  @override
  String get colorName => name;
}
