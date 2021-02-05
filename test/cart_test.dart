import 'package:flutter_test/flutter_test.dart';
import 'package:test_unitaire/src/managers/feature_cart_manager/cart_manager.dart';
import 'package:rxdart/rxdart.dart';

void main() {


group('CartManager T -', () {

  test('Initial Item', (){
    // Setup
    final CartManager manager = CartManager();
    // ACtion 
    final BehaviorSubject<List<ItemState>> product = manager.items;
    // Result
    expect(product.value.length, 0);
  });  


  test('when I call method Add, L\'element ajouter  doit etre dans le tableau', (){
    // Setup
    final CartManager manager = CartManager();
    const ItemState item =  ItemState(1, 'lola');
    // ACtion 
    manager.add(item);
    // Result
    expect(manager.items.value.contains(item), true);
  }); 
});


  test('when I call method Add, L\'element ajouter  doit etre dans le tableau', (){
    // Setup
    final CartManager manager = CartManager();
     const List<ItemState> data = <ItemState>[
       ItemState(1, 'lola'),
       ItemState(2, 'lola'),
       ItemState(3, 'lola'),
       ItemState(4, 'lola'),
    ];

    print(data.length);
    
    // ACtion 
    // ignore: avoid_function_literals_in_foreach_calls
    data.forEach((ItemState element) => manager.add(element));
    // Result
    expect(manager.items.value.length == data.length, true);
  }); 
  
}