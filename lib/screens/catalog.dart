import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_color_pallete/model/favorite.dart';
import 'package:flutter_color_pallete/model/catalog.dart';

class Catalog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        AppBar(),
        const SliverToBoxAdapter(child: SizedBox(height: 12)),
        SliverList(
            delegate: SliverChildBuilderDelegate(
                (context, index) => _ColorItem(index)))
      ],
    ));
  }
}

class AppBar extends StatelessWidget {

  Widget build(BuildContext context) {
    void onPressed() {
      Navigator.pushReplacementNamed(context, "/favorites");
    }

    return SliverAppBar(
      title: Text(
        "Colors",
        style: Theme.of(context).textTheme.headline4,
      ),
      floating: true,
      actions: [
        IconButton(onPressed: onPressed, icon: const Icon(Icons.favorite))
      ],
    );
  }
}

class _ColorItem extends StatelessWidget {
  final int itemIndex;
  const _ColorItem(this.itemIndex, {Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    final catalog = context.select((CatalogModel model) => model);
    final favorites = context.select((FavoriteModel model) => model);
    final ItemColor colorItem = catalog.randomColor(itemIndex);

    void onPressFavorite(ItemColor color) {
      favorites.isFavorite(color)
          ? favorites.remove(color)
          : favorites.add(color);
      print(favorites.favoriteColors);
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: LimitedBox(
        maxHeight: 48,
        child: Row(
          children: [
            AspectRatio(
                aspectRatio: 1,
                child: Container(
                    decoration: BoxDecoration(
                        color: colorItem.color,
                        borderRadius: BorderRadius.circular(12)))),
            const SizedBox(width: 24),
            Expanded(
                child: Text(colorItem.name,
                    style: Theme.of(context).textTheme.bodyText1)),
            const SizedBox(width: 25),
            Consumer<FavoriteModel>(
              builder: (context, favorites, d) => TextButton(
                  onPressed: () => onPressFavorite(colorItem),
                  child: Icon(favorites.isFavorite(colorItem)
                      ? Icons.favorite
                      : Icons.favorite_border)),
            ),
          ],
        ),
      ),
    );
  }
}
