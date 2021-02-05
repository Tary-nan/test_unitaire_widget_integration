import 'package:flutter/material.dart';
import 'package:sprinkle/Manager.dart';

@immutable
///
///
class CatalogManager implements Manager {
  ///
  final List<String> names = <String>[
    'Code Smell',
    'Control Flow',
    'Interpreter',
    'Recursion',
    'Sprint',
    'Heisenbug',
    'Spaghetti',
    'Hydra Code',
    'Off-By-One',
    'Scope',
    'Callback',
    'Closure',
    'Automata',
    'Bit Shift',
    'Currying',
  ];

  @override
  void dispose() {}
}