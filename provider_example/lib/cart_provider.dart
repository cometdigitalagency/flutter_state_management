import 'package:flutter/material.dart';
import 'models/item_model.dart';

class CartProvider extends ChangeNotifier {
  final List<ItemModel> _items = [];
  List<ItemModel> get items => _items;
  int get totalPrice {
    int sum = 0;
    for (var item in _items) {
      sum += item.price;
    }
    return sum;
  }

  void addItem(ItemModel item) {
    _items.add(item);
    notifyListeners();
  }

  void removeAll() {
    _items.clear();
    notifyListeners();
  }
}
