import 'package:flutter/material.dart';

import '../modals/product.dart';

class ProductProvider with ChangeNotifier {
  final List<Product> _products = [
    // Sample products
    Product(
      id: '1',
      name: 'Paracetamol 500mg',
      description: 'Pain relief and fever reduction tablet',
      price: 199.0,
      imageUrl: 'https://via.placeholder.com/200',
      isDonatable: true,
      stockQuantity: 100,
      category: 'Pain Relief',
      manufacturer: 'HealthCare Pharma',
      tags: ['fever', 'pain relief', 'headache'],
    ),
    Product(
      id: '2',
      name: 'Vitamin C 1000mg',
      description: 'Immunity booster supplements',
      price: 299.0,
      imageUrl: 'https://via.placeholder.com/200',
      isDonatable: false,
      stockQuantity: 50,
      category: 'Vitamins',
      manufacturer: 'Wellness Labs',
      tags: ['immunity', 'vitamins', 'supplements'],
    ),
    // Add more sample products as needed
  ];

  // Get all products
  List<Product> get products => [..._products];

  // Get donatable products
  List<Product> get donatableProducts =>
      _products.where((product) => product.isDonatable).toList();

  // Get product by id
  Product? findById(String id) =>
      _products.firstWhere((product) => product.id == id);

  // Get products by category
  List<Product> getProductsByCategory(String category) =>
      _products.where((product) => product.category == category).toList();

  // Add new product
  void addProduct(Product product) {
    _products.add(product);
    notifyListeners();
  }

  // Update product
  void updateProduct(String id, Product newProduct) {
    final prodIndex = _products.indexWhere((prod) => prod.id == id);
    if (prodIndex >= 0) {
      _products[prodIndex] = newProduct;
      notifyListeners();
    }
  }

  // Delete product
  void deleteProduct(String id) {
    _products.removeWhere((prod) => prod.id == id);
    notifyListeners();
  }

  // Search products
  List<Product> searchProducts(String query) {
    return _products
        .where((product) =>
            product.name.toLowerCase().contains(query.toLowerCase()) ||
            product.description.toLowerCase().contains(query.toLowerCase()) ||
            product.tags
                .any((tag) => tag.toLowerCase().contains(query.toLowerCase())))
        .toList();
  }
}
