import 'package:flutter/material.dart';
import 'package:hello/product.dart';
import 'package:hello/productdetailscreen.dart';

class ProductListingScreen extends StatelessWidget {
  final String category;

  ProductListingScreen({required this.category});

  // Replace this dummy list with your actual list of products for the selected category
  final List<Product> products = [
    Product(
      name: 'Iphone 10',
      description: 'Deep White with 128GB Storage.',
      price: 1099.00,
      imageUrls: ['assets/iphonexfont.png', 'assets/iphonexback.png'],
    ),
    Product(
      name: 'Samsung S23 Ultra',
      description: 'black with 128GB Storage.',
      price: 1000.00,
      imageUrls: ['assets/s23font.png', 'assets/samback.jpg'],
    ),
    // Add more products as needed...
  ];
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Listing - $category'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Adjust the number of columns as needed
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          return _buildProductCard(context, products[index]);
        },
      ),
    );
  }

  Widget _buildProductCard(BuildContext context, Product product) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailsScreen(
              product: product,
            ),
          ),
        );
      },
      child: Card(
        margin: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Image.asset(product.imageUrls[0], fit: BoxFit.cover),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    product.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    '\$${product.price.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
