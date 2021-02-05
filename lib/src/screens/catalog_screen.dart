import 'package:flutter/material.dart';
import 'package:sprinkle/Observer.dart';
import 'package:sprinkle/SprinkleExtension.dart';
import 'package:test_unitaire/src/managers/feature_calog_manager/catalog_manager.dart';
import 'package:test_unitaire/src/managers/feature_cart_manager/cart_manager.dart';
//import 'package:test_unitaire/src/managers/item.dart';


///
/// catalogue screen
///
class CatalogScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          _MyAppBar(),
          const SliverToBoxAdapter(child: SizedBox(height: 12)),
          SliverList(
            delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
              if (index > 14) 
              return null;
              return _MyListItem(index);
            }),
          ),
        ],
      ),
    );
  }
}

class _AddButton extends StatelessWidget {
  const _AddButton({Key key, @required this.item}) : super(key: key);
  final ItemState item;

  @override
  Widget build(BuildContext context) {
    final CartManager cart = context.use<CartManager>();

    return Observer<List<ItemState>>(
      stream: cart.items,
      builder: (BuildContext context, List<ItemState> items) {
        return FlatButton(
          onPressed: () => cart.add(item),
          child: items.contains(item)
              ? const Icon(Icons.check, semanticLabel: 'ADDED')
              : const Text('ADD'),
        );
      },
    );
  }
}

class _MyAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CartManager cart = context.use<CartManager>();

    return SliverAppBar(
      title: const Text('Catalog'),
      floating: true,
      actions: <Widget>[
        Observer<List<ItemState>>(
            stream: cart.items,
            builder: (BuildContext context,List<ItemState> data) => Chip(
                  label: Text(
                    data.length.toString(),
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  backgroundColor: Colors.grey,
                )),
        IconButton(
          icon: const Icon(Icons.shopping_cart),
          onPressed: () => Navigator.pushNamed(context, '/cart'),
        ),
      ],
    );
  }
}

class _MyListItem extends StatelessWidget {
  const _MyListItem(this.index, {Key key}) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    final CatalogManager manager = context.use<CatalogManager>();
    final ItemState item = ItemState(index, manager.names[index]);

    final TextStyle textTheme = Theme.of(context).textTheme.headline6;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: LimitedBox(
        maxHeight: 48,
        child: Row(
          children: <Widget>[
            AspectRatio(aspectRatio: 1, child: Container(color: Colors.primaries[item.id % Colors.primaries.length])),
            const SizedBox(width: 24),
            Expanded(child: Text(item.name, style: textTheme)),
            const SizedBox(width: 24),
            _AddButton(item: item),
          ],
        ),
      ),
    );
  }
}