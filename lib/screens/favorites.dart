import 'package:flutter/material.dart';
import 'package:flutter_color_pallete/model/catalog.dart';
import 'package:flutter_color_pallete/model/favorite.dart';
import 'package:provider/provider.dart';

class Favorites extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    void onReturn() {
      Navigator.pushReplacementNamed(context, "/catalog");
    }

    return Scaffold(
        appBar: AppBar(
            title: Text('Favorites'),
            leading: TextButton(
                child: Icon(Icons.arrow_back, color: Colors.white),
                onPressed: onReturn)),
        body: Consumer<FavoriteModel>(
            builder: (context, favorites, widget) => FavoriteList()));
  }
}

class FavoriteList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final favorites = context.select((FavoriteModel model) => model);
    final List<Widget> favoriteList = [];

    favorites.favoriteColors.forEach((element) {
      favoriteList.add(FavoriteColorItem(element));
    });

    return ListView(children: favoriteList);
  }
}

class FavoriteColorItem extends StatelessWidget {
  final ItemColor colorItem;
  const FavoriteColorItem(this.colorItem, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final favorites = context.select((FavoriteModel model) => model);

    void onRemoveFavorite() {
      favorites.remove(colorItem);
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
                  onPressed: onRemoveFavorite, child: Icon(Icons.delete)),
            ),
          ],
        ),
      ),
    );
  }
}
