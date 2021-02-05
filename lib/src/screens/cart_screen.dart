import 'package:flutter/material.dart';
import 'package:sprinkle/Observer.dart';
import 'package:sprinkle/SprinkleExtension.dart';
import 'package:test_unitaire/src/managers/feature_cart_manager/cart_manager.dart';
//import 'package:test_unitaire/src/managers/item.dart';

///
class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        backgroundColor: Colors.white,
      ),
      body: Container(
        color: Colors.yellow,
        child: Column(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: _CartList(),
              ),
            ),
            const Divider(height: 4, color: Colors.black),
            _CartTotal()
          ],
        ),
      ),
    );
  }
}

class _CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextStyle itemNameStyle = Theme.of(context).textTheme.headline6;
    final CartManager cart = context.use<CartManager>();

    return Observer<List<ItemState>>(
        stream: cart.items,
        builder: (BuildContext context, List<ItemState> items) {
          return ListView.builder(
            itemCount: items.length,
            itemBuilder: (BuildContext context, int index) => ListTile(
              leading: const Icon(Icons.done),
              title: Text(
                items[index].name,
                style: itemNameStyle,
              ),
            ),
          );
        });
  }
}

class _CartTotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextStyle hugeStyle =
        Theme.of(context).textTheme.headline1.copyWith(fontSize: 24);

    final CartManager cart = context.use<CartManager>();

    return SizedBox(
      height: 200,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Observer<List<ItemState>>(
              stream: cart.items,
              builder: (BuildContext context, List<ItemState> data) {
                return Text('\$${cart.total}', style: hugeStyle);
              },
            ),
            const SizedBox(width: 24),
            FlatButton(
              onPressed: () {
                Scaffold.of(context).showSnackBar(
                    const SnackBar(content: Text('Buying not supported yet.')));
              },
              color: Colors.white,
              child: const Text('BUY'),
            ),
          ],
        ),
      ),
    );
  }
}