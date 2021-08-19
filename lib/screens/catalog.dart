import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_color_pallete/model/catalog.dart';

class Catalog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final valueThatNeverChanges = context.select((CatalogModel model) => model);
    print(valueThatNeverChanges.generateRandomColor);

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
  void onPressed(BuildContext context) {
    // change route
  }

  Widget build(BuildContext context) {
    return SliverAppBar(
      title: Text(
        "Catalog",
        style: Theme.of(context).textTheme.headline4,
      ),
      floating: true,
      actions: [
        IconButton(
            onPressed: () => onPressed, icon: const Icon(Icons.shopping_bag))
      ],
    );
  }
}

class _ColorItem extends StatelessWidget {
  final int itemIndex;
  const _ColorItem(this.itemIndex, {Key? key}) : super(key: key);

  Widget build(BuildContext context) {
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
                        color: Colors.pink,
                        borderRadius: BorderRadius.circular(12)))),
            const SizedBox(width: 24),
            Expanded(
                child: Text("item name",
                    style: Theme.of(context).textTheme.bodyText1)),
            const SizedBox(width: 25),
            TextButton(onPressed: () => {}, child: Text("add"))
          ],
        ),
      ),
    );
  }
}
