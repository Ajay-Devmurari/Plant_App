import 'package:flutter/cupertino.dart';

import '../model/plant_model.dart';

class CartProvider with ChangeNotifier {
  final List<Plant> _cartItems = [];

  List<Plant> get cartItems => _cartItems;

  void addItem(Plant plant) {
    _cartItems.add(plant);
    notifyListeners();
  }

  void removeItem(Plant plant) {
    _cartItems.remove(plant);
    notifyListeners();
  }
}
