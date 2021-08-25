import 'package:flutter/material.dart';
import 'package:flutter_color_pallete/model/catalog.dart';
import 'package:flutter_color_pallete/model/favorite.dart';
import 'package:provider/provider.dart';

class Favorites extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final favorites = context.select((FavoriteModel model) => model);
    final List<Widget> favoriteList = [];

    favorites.favoriteColors.forEach((element) {
      favoriteList.add(FavoriteColorItem(element));
    });

    return Scaffold(
        appBar: AppBar(
          title: Text('Favorites'),
        ),
        body: ListView(
          children: favoriteList,
        ));
  }
}

class FavoriteColorItem extends StatelessWidget {
  final ItemColor colorItem;
  const FavoriteColorItem(this.colorItem, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  
    void onRemoveFavorite(ItemColor color) {}
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
                  onPressed: () => onRemoveFavorite(colorItem),
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
