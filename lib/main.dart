import 'package:flutter/material.dart';
import 'package:sprinkle/Supervisor.dart';
import 'package:sprinkle/sprinkle.dart';
import 'package:test_unitaire/src/managers/feature_calog_manager/catalog_manager.dart';
import 'package:test_unitaire/src/managers/feature_cart_manager/cart_manager.dart';
import 'package:test_unitaire/src/screens/cart_screen.dart';
import 'package:test_unitaire/src/screens/catalog_screen.dart';
import 'package:test_unitaire/src/screens/login_screen.dart';

///
/// le supervisor
///
Supervisor supervisor = Supervisor()
    .register<CartManager>(() => CartManager())
    .register<CatalogManager>(() => CatalogManager());

void main() {
  runApp(Sprinkle(supervisor: supervisor, child: App()));
}

///
///
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.yellow),
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (BuildContext context) => LoginScreen(),
        '/catalog': (BuildContext context) => CatalogScreen(),
        '/cart': (BuildContext context) => CartScreen(),
      },
    );
  }
}
