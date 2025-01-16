import 'package:flutter/material.dart';
import 'package:untitled/modals/product.dart';

import '../modals/cart_item.dart';

class CartProvider with ChangeNotifier {
  final Map<String, CartItem> _items = {};

  // Get all cart items
  Map<String, CartItem> get items => {..._items};

  // Get total cart items count
  int get itemCount => _items.length;

  // Get total cart price
  double get totalAmount {
    return _items.values.fold(0.0, (sum, item) => sum + item.total);
  }

  // Add a product to the cart
  void addItem(
    Product displayProduct, {
    required String productId,
    required String title,
    required double price,
  }) {
    if (_items.containsKey(productId)) {
      // Update quantity if item exists
      _items.update(
        productId,
        (existingItem) => existingItem.copyWith(
          quantity: existingItem.quantity + 1,
        ),
      );
    } else {
      // Add new item to cart
      _items[productId] = CartItem(
        id: DateTime.now().toString(),
        productId: productId,
        title: title,
        quantity: 1,
        price: price,
      );
    }
    notifyListeners();
  }

  // Remove an item from the cart
  void removeItem(String productId) {
    _items.remove(productId);
    notifyListeners();
  }

  // Reduce the quantity of a cart item
  void reduceItemQuantity(String productId) {
    if (!_items.containsKey(productId)) return;

    final existingItem = _items[productId]!;
    if (existingItem.quantity > 1) {
      _items.update(
        productId,
        (existingItem) => existingItem.copyWith(
          quantity: existingItem.quantity - 1,
        ),
      );
    } else {
      _items.remove(productId);
    }
    notifyListeners();
  }

  // Clear the cart
  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}
