import 'package:flutter/material.dart';
import 'package:inventory_management_system/model/inventory_item.dart';


class InventoryProvider with ChangeNotifier {
  List<InventoryItem> _items = [
    InventoryItem(name: 'Electronics', description: 'Comprises of electronic items'),
    InventoryItem(name: 'Groceries', description: 'Comprises of household food stuff'),
    InventoryItem(name: 'Home Appliances', description: 'Comprises of household appliances'),
    InventoryItem(name: 'Clothing', description: 'Comprises of apparel items'),
  ];

  List<InventoryItem> get items => _items;

  void addItem(InventoryItem item) {
    _items.add(item);
    notifyListeners();
  }

  void updateItem(int index, InventoryItem newItem) {
    _items[index] = newItem;
    notifyListeners();
  }

  void removeItem(int index) {
    _items.removeAt(index);
    notifyListeners();
  }
}
