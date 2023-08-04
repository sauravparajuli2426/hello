import 'package:flutter/material.dart';
import 'package:hello/product.dart';

class CartItemsProvider extends ChangeNotifier {
  List<Product> cartItems = [];

  void addToCart(Product product) {
    cartItems.add(product);
    notifyListeners();
  }

  void removeFromCart(Product product) {
    cartItems.remove(product);
    notifyListeners();
  }
}
