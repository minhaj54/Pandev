class Product {
  final String id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  final bool isDonatable;
  final int stockQuantity;
  final String category;
  final String manufacturer;
  final List<String> tags;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    this.isDonatable = false,
    this.stockQuantity = 0,
    this.category = '',
    this.manufacturer = '',
    this.tags = const [],
  });

  // Convert Product to Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'imageUrl': imageUrl,
      'isDonatable': isDonatable,
      'stockQuantity': stockQuantity,
      'category': category,
      'manufacturer': manufacturer,
      'tags': tags,
    };
  }

  // Create Product from Map
  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      price: (map['price'] ?? 0.0).toDouble(),
      imageUrl: map['imageUrl'] ?? '',
      isDonatable: map['isDonatable'] ?? false,
      stockQuantity: map['stockQuantity'] ?? 0,
      category: map['category'] ?? '',
      manufacturer: map['manufacturer'] ?? '',
      tags: List<String>.from(map['tags'] ?? []),
    );
  }

  // Copy with method for immutability
  Product copyWith({
    String? id,
    String? name,
    String? description,
    double? price,
    String? imageUrl,
    bool? isDonatable,
    int? stockQuantity,
    String? category,
    String? manufacturer,
    List<String>? tags,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      imageUrl: imageUrl ?? this.imageUrl,
      isDonatable: isDonatable ?? this.isDonatable,
      stockQuantity: stockQuantity ?? this.stockQuantity,
      category: category ?? this.category,
      manufacturer: manufacturer ?? this.manufacturer,
      tags: tags ?? this.tags,
    );
  }
}
