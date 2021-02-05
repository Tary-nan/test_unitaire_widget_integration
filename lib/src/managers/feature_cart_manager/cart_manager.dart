import 'dart:collection';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sprinkle/Manager.dart';
import 'package:sprinkle/SprinkleExtension.dart';
//import 'package:test_unitaire/src/managers/item.dart';
import 'package:rxdart/rxdart.dart';


part 'cart_manager.freezed.dart';

@freezed
/// abstract class ItemState with _$ItemState 
abstract class ItemState with _$ItemState {
  ///  Item(int id, String name)
  const factory ItemState(int id, String name, [@Default(42) int price]) = Data;
}

///
/// les getter intervienne lorsque 
/// vous voulez avoir access au attributs de votre object
///

/// cartManager est le gestionnaire de donnee des cart
class CartManager extends Manager {

/// je declare une BehaviorSubject pour stocker mes donnée
  final BehaviorSubject<List<ItemState>> items = <ItemState>[].reactive;

/// le getter total calcul la sommme des prix des produits 
  int get total =>
      items.value.fold<int>(0, (int total, ItemState current) => total + current.price);

/// length to items
  int get count => items.value.length;

/// adda product at the list
  void add(ItemState item) {
    items.value = UnmodifiableListView<ItemState>(<ItemState>[...items.value, item]);
    // items.value = <Item>[...items.value, item];
  }

/// add If Not Added
  void addIfNotAdded(ItemState item) {
    if (! items.value.contains(item)) {
      items.value.add(item);
      print('- ${items.value}');
    }
  }

  @override
  void dispose() {
    items?.close();
  }
}