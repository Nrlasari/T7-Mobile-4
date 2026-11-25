import 'package:flutter/material.dart';

class Product {
  final String nama;

  const Product(this.nama);
}

class CartModel extends ChangeNotifier {
  final List<Product> _items = [];

  List<Product> get items => List.unmodifiable(_items);
  int get totalItems => _items.length;

  void add(Product product) {
    _items.add(product);
    notifyListeners();
  }

  void removeAt(int index) {
    if (index < 0 || index >= _items.length) return;
    _items.removeAt(index);
    notifyListeners();
  }
}
