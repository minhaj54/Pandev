// lib/widgets/shop/product_card.dart
import 'package:flutter/material.dart';

import '../../modals/product.dart';

class ProductCard extends StatelessWidget {
  final Product? product;
  final bool isHorizontal;

  ProductCard({
    super.key,
    this.product,
    this.isHorizontal = false,
  });

  @override
  Widget build(BuildContext context) {
    // Demo product if none provided
    final displayProduct = product ??
        Product(
          id: '1',
          name: 'Paracetamol 500mg',
          description: 'Pain relief tablet',
          price: 199.0,
          imageUrl: 'https://via.placeholder.com/200',
          isDonatable: true,
        );

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: () {
          // Navigate to product detail
          Navigator.pushNamed(
            context,
            '/product-detail',
            arguments: displayProduct,
          );
        },
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Product Image with Discount Badge
              Expanded(
                flex: 3,
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Hero(
                          tag: 'product-${displayProduct.id}',
                          child: Image.network(
                            displayProduct.imageUrl,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Icon(
                                Icons.medical_services,
                                size: 50,
                                color: Colors.grey[400],
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    if (displayProduct.isDonatable)
                      Positioned(
                        top: 8,
                        left: 8,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            'Donatable',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),

              // Product Info
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Name and Description
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            displayProduct.name,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 4),
                          Text(
                            displayProduct.description,
                            style:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
                                      color: Colors.grey[600],
                                    ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),

                      // Price and Add to Cart
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '₹${displayProduct.price.toStringAsFixed(2)}',
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: IconButton(
                              icon: Icon(Icons.add_shopping_cart,
                                  color: Colors.white),
                              onPressed: () {},
                              // onPressed: () {
                              //   context.read<CartProvider>().addItem(
                              //         displayProduct,
                              //         productId: '',
                              //       );
                              //   ScaffoldMessenger.of(context).showSnackBar(
                              //     SnackBar(
                              //       content: Text('Added to cart'),
                              //       duration: Duration(seconds: 2),
                              //       action: SnackBarAction(
                              //         label: 'UNDO',
                              //         onPressed: () {
                              //           context
                              //               .read<CartProvider>()
                              //               .removeItem(displayProduct.id);
                              //         },
                              //       ),
                              //     ),
                              //   );
                              // },
                              constraints: BoxConstraints.tightFor(
                                width: 32,
                                height: 32,
                              ),
                              padding: EdgeInsets.zero,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Example usage in ProductsScreen
class ProductsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Medical Store')),
      body: LayoutBuilder(
        builder: (context, constraints) {
          // Responsive grid layout
          int crossAxisCount;
          if (constraints.maxWidth > 1200) {
            crossAxisCount = 4; // Large screens
          } else if (constraints.maxWidth > 800) {
            crossAxisCount = 3; // Medium screens
          } else if (constraints.maxWidth > 600) {
            crossAxisCount = 2; // Small tablets
          } else {
            crossAxisCount = 2; // Phones
          }

          return GridView.builder(
            padding: EdgeInsets.all(16),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              childAspectRatio: 0.75,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
            ),
            itemBuilder: (ctx, i) => ProductCard(),
            itemCount: 10, // Replace with actual product count
          );
        },
      ),
    );
  }
}
